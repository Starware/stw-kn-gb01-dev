[MERGE INTO car_ins c 
      USING (SELECT '@carcod@' carcod, '@pol_num@' pol_num, '@provider_adr_id@' provider_adr_id, 
                    to_number('@max_coverage_amt@') max_coverage_amt, to_number('@shp_prov_cov_flg@') shp_prov_cov_flg, 
                    to_date('@effdte@','YYYYMMDDHH24MISS') effdte, to_date('@expdte@','YYYYMMDDHH24MISS') expdte, '@ins_typ@' ins_typ  
                    FROM dual) input 
         ON (c.carcod = input.carcod
             AND c.pol_num = input.pol_num
             AND c.provider_adr_id = input.provider_adr_id)
 WHEN NOT MATCHED THEN
     INSERT (carcod, pol_num, provider_adr_id, max_coverage_amt, shp_prov_cov_flg, effdte, expdte, ins_typ) 
     VALUES (input.carcod, input.pol_num, input.provider_adr_id, input.max_coverage_amt, input.shp_prov_cov_flg, 
             input.effdte, input.expdte, input.ins_typ)]
