[MERGE INTO les_ath_pmsn l 
      USING (SELECT '@pmsn_id@' pmsn_id, @bit_pos@ bit_pos, '@pmsn_typ_cod@' pmsn_typ_cod, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (l.pmsn_id = input.pmsn_id)
 WHEN NOT MATCHED THEN
     INSERT (pmsn_id, bit_pos, pmsn_typ_cod, grp_nam) 
     VALUES (input.pmsn_id, input.bit_pos, input.pmsn_typ_cod, input.grp_nam)]
