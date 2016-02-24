IMPORT ClaimsFiles, Relationship;

parties := ClaimsFiles.FileParties;

relatives := Relationship.key_relatives_v3;

filteredRelatives := relatives (DID1 IN SET(DEDUP(SORT(parties, adl), adl), adl) OR ((INTEGER)DID1 BETWEEN 1 AND 10001));

EXPORT SlimRelativesKey := INDEX(filteredRelatives, {DID1}, {filteredRelatives}, '~bpahl::key::relatives_v3_qa_slim');