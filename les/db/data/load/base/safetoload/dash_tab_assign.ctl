[MERGE INTO dash_tab_assign d
      USING (SELECT '@ath_id@' ath_id, '@ath_typ@' ath_typ, '@tab_id@' tab_id, @srtseq@ srtseq, '@description@' description,
                    '@grp_nam@' grp_nam
                    FROM dual) input
         ON (d.ath_id = input.ath_id
             AND d.ath_typ = input.ath_typ
             AND d.tab_id = input.tab_id)
 WHEN NOT MATCHED THEN
     INSERT (ath_id, ath_typ, tab_id, srtseq, description, grp_nam)
     VALUES (input.ath_id, input.ath_typ, input.tab_id, input.srtseq, input.description, input.grp_nam)]
