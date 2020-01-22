[MERGE INTO vehtyp v 
      USING (SELECT '@vehtyp_id@' vehtyp_id, @voc_cod@ voc_cod, to_date('@moddte@','YYYYMMDDHH24MISS') moddte, '@mod_usr_id@' mod_usr_id, 
                    @veh_lod_limit@ veh_lod_limit
                    FROM dual) input 
         ON (v.vehtyp_id = input.vehtyp_id)
 WHEN NOT MATCHED THEN
     INSERT (vehtyp_id, voc_cod, moddte, mod_usr_id, veh_lod_limit) 
     VALUES (input.vehtyp_id, input.voc_cod, input.moddte, input.mod_usr_id, input.veh_lod_limit)]
