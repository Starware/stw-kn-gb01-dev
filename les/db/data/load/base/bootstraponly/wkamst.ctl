[MERGE INTO wkamst w 
      USING (SELECT '@wrkare@' wrkare, '@wh_id@' wh_id, to_number('@prithr@') prithr, to_number('@hmemaxprithr@') hmemaxprithr, 
                    to_number('@maxprithr@') maxprithr, to_number('@voc_cod@') voc_cod, to_number('@dist_thresh@') dist_thresh
                    FROM dual) input 
         ON (w.wrkare = input.wrkare
             AND w.wh_id = input.wh_id) 
 WHEN NOT MATCHED THEN
     INSERT (wrkare, wh_id, prithr, hmemaxprithr, maxprithr, voc_cod, dist_thresh) 
     VALUES (input.wrkare, input.wh_id, input.prithr, input.hmemaxprithr, input.maxprithr, input.voc_cod, input.dist_thresh)]
