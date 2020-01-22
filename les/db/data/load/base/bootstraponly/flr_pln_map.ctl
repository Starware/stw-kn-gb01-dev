[MERGE INTO flr_pln_map f 
      USING (SELECT '@id@' id, '@wh_id@' wh_id, '@bldg_id@' bldg_id, '@type@' type, @x@ x, @y@ y, @height@ height, @width@ width
                    FROM dual) input 
         ON (f.id = input.id)
 WHEN NOT MATCHED THEN
     INSERT (id, wh_id, bldg_id, type, x, y, height, width) 
     VALUES (input.id, input.wh_id, input.bldg_id, input.type, input.x, input.y, input.height, input.width)]
