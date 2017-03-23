EXPORT Ingest_Copy_Promote := MODULE

EXPORT AR_Market_Maginifier := Vault.FN_Copy_and_Promote('~foreign::10.194.10.1::thor::base::ar::prod::marketmagnifier','analyt_thor400_90_b','~thor::base::ar','marketmagnifier');

EXPORT AR_NonFCRA_Shopping_Attribute := Vault.FN_Copy_and_Promote('~foreign::10.194.12.1::thor::base::ar::prod::ai_nonfcra_shoppingattributes','analyt_thor400_90_b','~thor::base::ar','ai_nonfcra_shoppingattributes');

END;