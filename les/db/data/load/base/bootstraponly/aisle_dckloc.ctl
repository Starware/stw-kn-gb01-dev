[MERGE INTO aisle_dckloc a 
      USING (SELECT @aisle_dckloc_id@ aisle_dckloc_id, '@wh_id@' wh_id, '@aisle_id@' aisle_id, '@dckloc@' dckloc, '@stgloc@' stgloc, 
                    '@bldg_id@' bldg_id, '@dckmode@' dckmode, to_number('@seqnum_primary@') seqnum_primary, 
                    to_number('@seqnum_secondary@') seqnum_secondary
                    FROM dual) input 
         ON (a.aisle_dckloc_id = input.aisle_dckloc_id
             AND a.wh_id = input.wh_id) 
 WHEN NOT MATCHED THEN
     INSERT (aisle_dckloc_id, wh_id, aisle_id, dckloc, stgloc, bldg_id, dckmode, seqnum_primary, seqnum_secondary) 
     VALUES (input.aisle_dckloc_id, input.wh_id, input.aisle_id, input.dckloc, input.stgloc, input.bldg_id, input.dckmode, 
             input.seqnum_primary, input.seqnum_secondary)]
