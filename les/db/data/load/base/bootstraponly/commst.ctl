[MERGE INTO commst c 
      USING (SELECT '@comcod@' comcod, '@ltlcls@' ltlcls, '@stccod@' stccod
                    FROM dual) input 
         ON (c.comcod = input.comcod)
 WHEN NOT MATCHED THEN
     INSERT (comcod, ltlcls, stccod) 
     VALUES (input.comcod, input.ltlcls, input.stccod)]
