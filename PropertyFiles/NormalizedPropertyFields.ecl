IMPORT PropertyFiles;

EXPORT NormalizedPropertyFields := MODULE

	OutRecOwnership := RECORD
		RECORDOF(PropertyFiles.Ownership) - fares;
		string12 ln_fare_id;
	END;
	OutRecOwnership NormFares(RECORDOF(PropertyFiles.Ownership) L, RECORDOF(PropertyFiles.Ownership.fares) R) := TRANSFORM
		SELF.ln_fare_id := R.ln_fare_id;
		SELF := L;
	END;	
	
	OwnershipTmp := NORMALIZE(PropertyFiles.Ownership, LEFT.fares, NormFares(LEFT, RIGHT));
	
		
	OutFinalOwnership := RECORD
		OutRecOwnership - sale_price1 - sale_date1 - prev_purch_price1 - prev_purch_date1 - sale_price2 - sale_date2 - prev_purch_price2 - prev_purch_date2;
		unsigned salecounter;
		unsigned saleprice;
		unsigned saledate;
		unsigned prevsaleprice;
		unsigned prevsaledate;
	END;
	
	OutFinalOwnership NormPriceDate(OutRecOwnership L, C) := TRANSFORM
		SELF.salecounter := C;
    SELF.saleprice := CASE(C,
              1 => L.sale_price1,
              2 => L.sale_price2,0);
		SELF.prevsaleprice := CASE(C,
              1 => L.prev_purch_price1,
              2 => L.prev_purch_price2,0);
		SELF.saledate := CASE(C,
              1 => L.sale_date1,
              2 => L.sale_date2,0);
		SELF.prevsaledate := CASE(C,
              1 => L.prev_purch_date1,
              2 => L.prev_purch_date2,0);
		SELF := L;
	END;
	
	EXPORT PropertyOwnership := NORMALIZE(OwnershipTmp, 2, NormPriceDate(LEFT, COUNTER));
	
		
	OutTaxExemptionAssessor := RECORD
		RECORDOF(PropertyFiles.AssessorFID) - tax_exemption1_code - tax_exemption2_code - tax_exemption3_code - tax_exemption4_code;
		unsigned tax_exemption_code_counter;
		string1 tax_exemption_code;
	END;
	
	OutTaxExemptionAssessor NormTaxExemption(RECORDOF(PropertyFiles.AssessorFID) L, C) := TRANSFORM
		SELF.tax_exemption_code_counter := C;
    SELF.tax_exemption_code := CASE(C,
              1 => L.tax_exemption1_code,
              2 => L.tax_exemption2_code,
							3 => L.tax_exemption3_code,
							4 => L.tax_exemption4_code, '');
		SELF := L;
	END;
	
	EXPORT tmpPropertyAssessor := NORMALIZE(PropertyFiles.AssessorFID, 4, NormTaxExemption(LEFT, COUNTER));


		OutSchoolDistrictAssessor := RECORD
			RECORDOF(tmpPropertyAssessor) - school_tax_district1 - school_tax_district1_indicator - school_tax_district2 - school_tax_district2_indicator - school_tax_district3 - school_tax_district3_indicator;
			unsigned school_tax_district_counter;
			string15 school_tax_district;
			string1 school_tax_district_indicator;
		END;
	
	OutSchoolDistrictAssessor NormSchoolDistrict(RECORDOF(tmpPropertyAssessor) L, C) := TRANSFORM
		SELF.school_tax_district_counter := C;
    SELF.school_tax_district := CASE(C,
              1 => L.school_tax_district1,
              2 => L.school_tax_district2,
							3 => L.school_tax_district3, '');
		SELF.school_tax_district_indicator := CASE(C,
              1 => L.school_tax_district1_indicator,
              2 => L.school_tax_district2_indicator,
							3 => L.school_tax_district3_indicator, '');
		SELF := L;
	END;
	
	EXPORT tmp2PropertyAssessor := NORMALIZE(tmpPropertyAssessor, 3, NormSchoolDistrict(LEFT, COUNTER));
	
	OutBuildingAreaAssessor := RECORD
			RECORDOF(tmp2PropertyAssessor) - building_area1 - building_area1_indicator - building_area2 - building_area2_indicator - building_area3 - building_area3_indicator - building_area4 - building_area4_indicator - building_area5 - building_area5_indicator - building_area6 - building_area6_indicator - building_area7 - building_area7_indicator;
			unsigned building_area_counter;
		END;
	
	OutBuildingAreaAssessor NormBuildingArea(RECORDOF(tmp2PropertyAssessor) L, C) := TRANSFORM
		SELF.building_area_counter := C;
    SELF.building_area := CASE(C,
              1 => L.building_area,
              2 => L.building_area1,
							3 => L.building_area2,
              4 => L.building_area3,
							5 => L.building_area4,
              6 => L.building_area5,
							7 => L.building_area6,
              8 => L.building_area7, '');
		SELF.building_area_indicator := CASE(C,
              1 => L.building_area_indicator,
              2 => L.building_area1_indicator,
							3 => L.building_area2_indicator,
              4 => L.building_area3_indicator,
							5 => L.building_area4_indicator,
              6 => L.building_area5_indicator,
							7 => L.building_area6_indicator,
              8 => L.building_area7_indicator, '');
		SELF := L;
	END;
	
	EXPORT tmp3PropertyAssessor := NORMALIZE(tmp2PropertyAssessor, 8, NormBuildingArea(LEFT, COUNTER));
	
	OutSiteInfluenceAssessor := RECORD
			RECORDOF(tmp3PropertyAssessor) - site_influence1_code - site_influence2_code - site_influence3_code - site_influence4_code;
			unsigned site_influence_counter;
			string3 site_influence_code;
		END;
	
	OutSiteInfluenceAssessor NormSiteInfluence(RECORDOF(tmp3PropertyAssessor) L, C) := TRANSFORM
		SELF.site_influence_counter := C;
    SELF.site_influence_code := CASE(C,
              1 => L.site_influence1_code,
              2 => L.site_influence2_code, '');
		SELF := L;
	END;
	
	EXPORT tmp4PropertyAssessor := NORMALIZE(tmp3PropertyAssessor, 2, NormSiteInfluence(LEFT, COUNTER));
	
	OutAmenityAssessor := RECORD
			RECORDOF(tmp4PropertyAssessor) - amenities1_code - amenities2_code - amenities3_code;
			unsigned amenity_counter;
			string3 amenity_code;
		END;
	
	OutAmenityAssessor NormAmenity(RECORDOF(tmp4PropertyAssessor) L, C) := TRANSFORM
		SELF.amenity_counter := C;
    SELF.amenity_code := CASE(C,
              1 => L.amenities1_code,
              2 => L.amenities2_code,
							3 => L.amenities3_code, '');
		SELF := L;
	END;
	
	EXPORT tmp5PropertyAssessor := NORMALIZE(tmp4PropertyAssessor, 3, NormAmenity(LEFT, COUNTER));
	
	OutExtraFeaturesAssessor := RECORD
			RECORDOF(tmp5PropertyAssessor) - extra_features1_area - extra_features1_indicator - extra_features2_area - extra_features2_indicator - extra_features3_area - extra_features3_indicator - extra_features4_area - extra_features4_indicator;
			unsigned extra_features_counter;
			string9 extra_features_area;
			string2 extra_features_indicator;
		END;
	
	OutExtraFeaturesAssessor NormExtraFeatures(RECORDOF(tmp5PropertyAssessor) L, C) := TRANSFORM
		SELF.extra_features_counter := C;
    SELF.extra_features_area := CASE(C,
              1 => L.extra_features1_area,
              2 => L.extra_features2_area,
							3 => L.extra_features3_area,
							4 => L.extra_features4_area, '');
		SELF.extra_features_indicator := CASE(C,
              1 => L.extra_features1_indicator,
              2 => L.extra_features2_indicator,
							3 => L.extra_features3_indicator,
							4 => L.extra_features4_indicator, '');
		SELF := L;
	END;
	
	EXPORT tmp6PropertyAssessor := NORMALIZE(tmp5PropertyAssessor, 4, NormExtraFeatures(LEFT, COUNTER));

	OutOtherBuildingsAssessor := RECORD
			RECORDOF(tmp6PropertyAssessor) - other_buildings1_code - other_buildings2_code - other_buildings3_code - other_buildings4_code;
			unsigned oher_building_counter;
			string3 other_building_code;
		END;
	
	OutOtherBuildingsAssessor NormOtherBuildings(RECORDOF(tmp6PropertyAssessor) L, C) := TRANSFORM
		SELF.oher_building_counter := C;
    SELF.other_building_code := CASE(C,
              1 => L.other_buildings1_code,
              2 => L.other_buildings2_code,
							3 => L.other_buildings3_code,
							4 => L.other_buildings4_code, '');
		SELF := L;
	END;
	
	EXPORT tmp7PropertyAssessor := NORMALIZE(tmp6PropertyAssessor, 4, NormOtherBuildings(LEFT, COUNTER));


	
	OutOtherImpBuildingAssessor := RECORD
			RECORDOF(tmp7PropertyAssessor) - other_impr_building1_indicator - other_impr_building2_indicator - other_impr_building3_indicator - other_impr_building4_indicator - other_impr_building5_indicator - other_impr_building_area1 - other_impr_building_area2 - other_impr_building_area3 - other_impr_building_area4 - other_impr_building_area5;
			unsigned other_imp_building_counter;
			string2 other_imp_building_ind;
			string9 other_imp_building_area;
		END;
	
	OutOtherImpBuildingAssessor NormOtherImpBuildings(RECORDOF(tmp7PropertyAssessor) L, C) := TRANSFORM
		SELF.other_imp_building_counter := C;
    SELF.other_imp_building_ind := CASE(C,
              1 => L.other_impr_building1_indicator,
              2 => L.other_impr_building2_indicator,
							3 => L.other_impr_building3_indicator,
							4 => L.other_impr_building4_indicator,
							5 => L.other_impr_building5_indicator, '');
		SELF.other_imp_building_area := CASE(C,
              1 => L.other_impr_building_area1,
              2 => L.other_impr_building_area2,
							3 => L.other_impr_building_area3,
							4 => L.other_impr_building_area4,
							5 => L.other_impr_building_area5, '');
		SELF := L;
	END;
	
	EXPORT FinalPropertyAssessor := NORMALIZE(tmp7PropertyAssessor, 5, NormOtherImpBuildings(LEFT, COUNTER));
END;