[MERGE INTO les_refs_cust_pmsn_role l 
      USING (SELECT '@pmsn_id@' pmsn_id, '@ath_id@' ath_id
                    FROM dual) input 
         ON (l.pmsn_id = input.pmsn_id
             AND l.ath_id = input.ath_id) 
 WHEN NOT MATCHED THEN
     INSERT (pmsn_id, ath_id) 
     VALUES (input.pmsn_id, input.ath_id)]
