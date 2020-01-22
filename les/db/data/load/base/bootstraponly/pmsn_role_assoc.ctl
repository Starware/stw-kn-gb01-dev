[MERGE INTO pmsn_role_assoc tbl
      USING (SELECT '@pmsn_id@' pmsn_id,
                    '@role_id@' role_id,
                    '@pmsn_mask@' pmsn_mask
               FROM dual) input
         ON (tbl.pmsn_id = input.pmsn_id
        AND tbl.role_id = input.role_id)
 WHEN NOT MATCHED THEN
     INSERT (pmsn_id,
             role_id,
             pmsn_mask)
     VALUES (input.pmsn_id,
             input.role_id,
             input.pmsn_mask)]
