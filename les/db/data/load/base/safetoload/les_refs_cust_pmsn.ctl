[MERGE INTO les_refs_cust_pmsn l 
      USING (SELECT '@pmsn_id@' pmsn_id, @pmsn_mask@ pmsn_mask
                    FROM dual) input 
         ON (l.pmsn_id = input.pmsn_id) 
 WHEN NOT MATCHED THEN
     INSERT (pmsn_id, pmsn_mask) 
     VALUES (input.pmsn_id, input.pmsn_mask)]