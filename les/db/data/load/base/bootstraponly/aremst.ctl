[MERGE INTO aremst a 
      USING (SELECT '@arecod@' arecod, '@wh_id@' wh_id, '@bldg_id@' bldg_id, '@lost_loc@' lost_loc, to_number('@logic_flg@') logic_flg
                    FROM dual) input 
         ON (a.arecod = input.arecod
             AND a.wh_id = input.wh_id) 
 WHEN NOT MATCHED THEN
     INSERT (arecod, wh_id, bldg_id, lost_loc, logic_flg) 
     VALUES (input.arecod, input.wh_id, input.bldg_id, input.lost_loc, input.logic_flg)]
