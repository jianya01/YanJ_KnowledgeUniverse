﻿// CFK 02/23/2016 charles.kaminski@lexisnexis.com
// This code creates a prefix tree to 
//   significantly improve the performance of an 
//   edit distance algorythm.
// Read the code walk-through on the HPCC Systems blog
// https://hpccsystems.com/resources/blog?uid=225 
//==================================================================================================
//=============================== Build Prefix Tree ================================================
//==================================================================================================
Export MAC_Prefix_Tree_Create(infile, infield, dist_length) := FUNCTIONMACRO
   // This Function Macro creates a prefix tree 
	 // The prefix tree can be used to significantly speed up
	 // Edit-Distance searches and  also enable those searches at query time
	 // Inputs:
	 // infile  - The Thor file holding your data
	 // infield - The name of the field in the infile holding your data
	 // dist_length - The number of characters in the infield
	 //     used to distribute the data across the Thor cluster.
	 //     You want this number to be small enough so that like
	 //       records are on the same Thor.  But large enough so that
	 //       all of your Thor nodes are being used.
	 //       1 is a good value for small datasets.
	 //       2 is a good value for large datasets and clusters.
	 
	 // !!! The code below assumes a maximum number of Thor compute nodes  
	 // !!!  and a maximum number of prefix tree nodes on each Thor node.
	 // !!!  These maximums are suffient for any of our datasets and can 
	 // !!!  be adjusted to fit any future needs.  The current maximum
	 // !!!  number of Thor nodes assumed below is 92,233 compute nodes.  
	 // !!!  The code below assumes no more than 72 Trillion prefix tree nodes
	 // !!!  on EACH of the 92,233 Thor nodes.
	 
   WordLayout := RECORD
      STRING   word;
   END;
   WordLayout FormatWordsTransform(RECORDOF(infile) l) := TRANSFORM
      SELF.word := TRIM(l.infield);
   END;
	 
   // Trim the infield and get rid of any other fields
   cleaned_ds := PROJECT(infile, FormatWordsTransform(LEFT));
	 
   // Distribute the files across the Thor based on the dist_length parameter
   distributed_ds := DISTRIBUTE(cleaned_ds, HASH(cleaned_ds.word[dist_length]));
	 
   // Get rid of any empty entries
   input_ds := distributed_ds(word <> '');
	 
   NodesLayout := RECORD
      input_ds;
      // The nodes field is where we keep track of when nodes begin.  We're initializing the field to 
      // zero fill with the same number of zeros as characters in each word.
      // The extra '1' at the end is a place holder for an end-cap node representing the word itself.
      STRING    nodes        := REGEXREPLACE('.', input_ds.Word, '0') + '1'; 
      UNSIGNED4 node_cnt     := 0;        // The number of nodes in the word
      UNSIGNED4 compute_node := 0;        // The compute_node this record is on			
      DATA      node_ids     := (DATA)''; // Where we pack up the node IDs right before we normalize the prefix tree records
   END;
	 
   nodes_format_ds := TABLE(input_ds, NodesLayout, UNSORTED, LOCAL);
   STRING MarkNodes(STRING l, STRING l_nodes, STRING n, STRING n_nodes) := BEGINC++
      /// This C++ function is designed for use with ECL's Iterate to take a group of 
      /// strings and return the prefix tree node structures in a separate field.
      /// The function requires a sorted list and two passes (one in each direction) 
      /// l is for the last field, n is for the next field, out is for output
      /// nodes contain the indicator of if we should start a node
      /// An initial value of the node for each field is a string of 0 [zeros]
      /// the same length as the string in question -- an optional 1 can be
      /// added at the end as a word end-cap.
      /// CFK 08/05/2015   
      #option pure
      #body
      unsigned long i = 0;
      char * out = (char*)rtlMalloc(lenN_nodes);
      memcpy(out, n_nodes, lenN_nodes);
      while ( i < lenN){
         /// If the characters don't match or
         ///   if we are at the end of the last string then
         ///   flip the 0 to a 1 and break out of the loop
         if (l[i] != n[i] || i >= lenL){
            out[i] = '1';
            break;
         }
         if (l_nodes[i] != n_nodes[i]){
            out[i] = '1';
         }
         i += 1;
      }
      __lenResult = lenN_nodes;
      __result = out;
   ENDC++;
	 
   NodesLayout GetPTNodesTransform(NodesLayout L, NodesLayout R) := TRANSFORM
      SELF.nodes        := MarkNodes(L.word, L.nodes, R.word, R.nodes);
      SELF.node_cnt     := stringlib.StringFindCount(SELF.nodes,'1');
      SELF.compute_node := Thorlib.Node();			
      SELF := R;
   END;
   // Identify where the nodes for the prefix tree will be in your word field
   pt_nodes_1_ds := ITERATE(SORT(nodes_format_ds, -word, LOCAL), GetPTNodesTransform(LEFT, RIGHT), LOCAL);
   pt_nodes_2_ds := ITERATE(SORT(pt_nodes_1_ds,    word, LOCAL), GetPTNodesTransform(LEFT, RIGHT), LOCAL);
	 
   STRING AssignNodeIDs(STRING l, STRING l_nodes, UNSIGNED4 l_node_cnt, STRING l_node_ids,
                        STRING n, STRING n_nodes, UNSIGNED4 n_node_cnt, UNSIGNED4 compute_node) := BEGINC++
      /// This C++ function is designed for use with ECL's Iterate
      /// It assigns ID's to prefix tree nodes so that the nodes can later be broken out into 
      /// individual records with ECL's Normalize.
      /// CFK 08/05/2015   
      #option pure
      #body      
      unsigned long long last_node_id = 0;
      unsigned long i = 0;
      unsigned long node_cnt = 0;
      // The new value is empty.  
      // Could happen if there are blanks in your word list.
      if (n_node_cnt == 0){
         __lenResult = 0;
         return;
      }
      
      // Initialize "out" with node ID's from the last iteration
      //  But don't go over if there are too many node ID's from the last iteration
      char * out = (char*)rtlMalloc(n_node_cnt * 8);   
      i = (l_node_cnt < n_node_cnt) ? l_node_cnt : n_node_cnt;
      memcpy(out, l_node_ids, i * 8);
      // Find the ID assigned to the last node from the last word.
      //  This will be the starting point to assign new node IDs
      if (l_node_cnt != 0){
         memcpy(&last_node_id, &l_node_ids[(l_node_cnt - 1) * 8], 8);
      }
      else{
         // This is the starting point for node id on each compute node.
         // Setting last_node_id to a value based on the compute node's
         // unique id ensures that each prefix tree built locally on each 
         // compute node has unique non-overlapping ID's.  An unsigned long long
         // has a maximum value of 9,223,372,036,854,775,807 or 2^64 - 1.   
         // Multiplying compute_node by 10^14 allows for 92,233 compute nodes  
         // and 72 Trillion prefix tree nodes on each compute node.  These maximums
         // can be adjusted to fit your needs.
         last_node_id = (compute_node * 100000000000000);
      }	  
      // Find the first location where the two words don't match
      //  And keep track of how many nodes we've seen
      i = 0;
      while (i < lenL && i < lenN){
         if (l[i] != n[i]){
            break;
         }
         if (n_nodes[i] == '1'){
            node_cnt += 1;
         }
         i += 1;
      }
      
      // Start adding new node ids to  from where we left off
      while (i < lenN){
         if (n_nodes[i] == '1'){
            last_node_id += 1;
            node_cnt += 1;
            memcpy(&out[(node_cnt-1)*8], &last_node_id, 8);
         }
         i += 1;
      }
      
      // Add the final node id for the end-cap (referenced in comments at the top)
      last_node_id += 1;
      node_cnt +=1;
      memcpy(&out[(node_cnt-1) * 8], &last_node_id, 8);
      __lenResult = n_node_cnt * 8;
      __result    = out;
   ENDC++;
   NodesLayout GetNodeIdsTransform(NodesLayout L, NodesLayout R) := TRANSFORM
      SELF.compute_node := Thorlib.Node();
      SELF.node_ids     := (DATA) AssignNodeIDs(L.word, L.nodes, L.node_cnt, (STRING) L.node_ids,
                                                R.word, R.nodes, R.node_cnt, SELF.compute_node);
      SELF := R;
   END;
   node_ids_ds := ITERATE(SORT(pt_nodes_2_ds,  word, LOCAL), GetNodeIdsTransform(LEFT, RIGHT), LOCAL);
   UNSIGNED GetID(STRING node_ids, UNSIGNED4 node_to_retrieve) := BEGINC++
      /// Function returns a numeric node id from a group of node ids
      /// CFK 08/05/2015   
      #option pure
      #body   
      unsigned long long node_id = 0;
      if (node_to_retrieve != 0){
         memcpy(&node_id, &node_ids[(node_to_retrieve - 1) * 8], 8);
      }
      return node_id;
   ENDC++;
   STRING GetNode(STRING word, STRING nodes, UNSIGNED4 node_to_retrieve):= BEGINC++
      /// Function returns the substring associated with a node
      /// CFK 08/05/2015
      #option pure
      #body   
      unsigned int i = 0;
      unsigned int j = 0;
      unsigned int k = 0;
   
      // find the start (i) of the node in question
      while(i < lenNodes){
         if(nodes[i] == '1'){
            j +=1;
         }
         if (j==node_to_retrieve){
            break;
         }
         i += 1 ;
      }
   
      j = i + 1;
   
      // find the end (j) of the node in question
      while(j < lenNodes){
         if (nodes[j] == '1'){
            break;
         }
         j += 1;
      }
   
      k = j - i;
      char * out = (char*)rtlMalloc(k);
      memcpy(&out[0], &word[i], k);
      __lenResult = k;
      __result   = out;
   
   ENDC++;
   PTLayout := RECORD
      UNSIGNED  id;            // Primary Key
      UNSIGNED  parent_id;     // The parent for this node.  Zero is a root node
      UNSIGNED1 _max;          // The max length of any child word for this node
      UNSIGNED1 _min;          // The min length of any child word for this node	 
      BOOLEAN   is_word;       // Indicates if this node is a word (an end-cap with no children)
      UNSIGNED4 compute_node;  // The compute-node ID this record was processed on			
      STRING    node;          // Contains the payload for this node			
      //UNSIGNED8 RecPtr {virtual(fileposition)};			
   END;
   PTLayout NormalizePTTransform(NodesLayout L, UNSIGNED4 C):= TRANSFORM
      SELF.id           := GetID((STRING)L.node_ids, C);
      SELF.parent_id    := GetID((STRING)L.node_ids, C-1);
      SELF.node         := IF(C=L.node_cnt, L.word, GetNode(L.word, L.nodes, C));
      SELF._max         := LENGTH(L.word);
      SELF._min         := LENGTH(L.word);			
      SELF.is_word      := IF(C=L.node_cnt, True, False);
      SELF.compute_node := Thorlib.Node();			
   END; 
   // Break each word record into multiple node records
   normalized_pt_ds := NORMALIZE(node_ids_ds, LEFT.node_cnt, NormalizePTTransform(LEFT,COUNTER));
	 
	 // Sort the dataset for a rollup
	 sorted_normalized_pt_ds := SORT(normalized_pt_ds, id, LOCAL);
   PTLayout RollupPTTransform(PTLayout L, PTLayout R) := TRANSFORM
      SELF._max := MAX(L._max, R._max);
      SELF._min := MIN(L._min, R._min);
      SELF      := R;
   END;
   //  Remove duplicates on each Thor Node and calculate Max and Min lengths
	 //  https://hpccsystems.com/resources/blog/ckaminski/accelerating-prefix-trees
   deduped_pt_ds := ROLLUP(sorted_normalized_pt_ds, LEFT.id = RIGHT.id, 
                         RollupPTTransform(LEFT, RIGHT), LOCAL);
	 RETURN deduped_pt_ds;
ENDMACRO;
/*
//=========================================
//=============== Example Usage ===========
//=========================================
InFileLayout := RECORD
   STRING   word;
END;
in_ds := DATASET('~OUT::CFK::LNames_Atl_GA_Words', InFileLayout, THOR);
SMALL_DATASET_OR_COMPUTE_CLUSTER := 1;
LARGE_DATASET_AND_CLUSTER := 2;
// This dataset will be distributed based on the first "2" letters in each word
//  Query performance can be improved by using a 1 for small datasets or small compute clusters.  
/   compute clusters.  2 is appropriate for large datasets and large compute clusters
pt_ds := MAC_Prefix_Tree_Create(in_ds, word, LARGE_DATASET_AND_CLUSTER);
OUTPUT(pt_ds, , '~OUT::CFK::LNames_Atl_GA_PT', OVERWRITE);
pt_index := INDEX(pt_ds, {parent_id}, {id, _max, _min, is_word, node}, '~OUT::CFK::LNames_Atl_GA_PT_Key');
BUILDINDEX(pt_index, OVERWRITE);
OUTPUT(pt_index)
*/
