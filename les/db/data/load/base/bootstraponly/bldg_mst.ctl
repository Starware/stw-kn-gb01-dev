[MERGE INTO bldg_mst b 
      USING (SELECT '@bldg_id@' bldg_id, '@wh_id@' wh_id, '@business_unt@' business_unt, '@adr_id@' adr_id, 
                    to_number('@fluid_load_flg@') fluid_load_flg, '@sort_attr_locsts@' sort_attr_locsts, 
                    to_number('@sort_default_flg@') sort_default_flg
                    FROM dual) input 
         ON (b.bldg_id = input.bldg_id
             AND b.wh_id = input.wh_id)
 WHEN NOT MATCHED THEN
     INSERT (bldg_id, wh_id, business_unt, adr_id, fluid_load_flg, sort_attr_locsts, sort_default_flg) 
     VALUES (input.bldg_id, input.wh_id, input.business_unt, input.adr_id, input.fluid_load_flg, input.sort_attr_locsts, 
             input.sort_default_flg)]
