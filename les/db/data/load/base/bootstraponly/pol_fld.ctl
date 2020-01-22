[MERGE INTO pol_fld p 
      USING (SELECT '@pol_id@' pol_id, '@pol_fld_nam@' pol_fld_nam, '@fld_als@' fld_als, '@fld_typ@' fld_typ, '@tt_mls_id@' tt_mls_id, 
                    nvl(to_number('@srt_seq@'), 0) srt_seq, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (p.pol_id = input.pol_id
             AND p.pol_fld_nam = input.pol_fld_nam)
 WHEN NOT MATCHED THEN
     INSERT (pol_id, pol_fld_nam, fld_als, fld_typ, tt_mls_id, srt_seq, grp_nam) 
     VALUES (input.pol_id, input.pol_fld_nam, input.fld_als, input.fld_typ, input.tt_mls_id, input.srt_seq, input.grp_nam)]
