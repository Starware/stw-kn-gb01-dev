[MERGE INTO cancod c 
      USING (SELECT '@codval@' codval, @srtseq@ srtseq, to_number('@reaflg@') reaflg, '@alctyp@' alctyp, '@cyc_cnt_cod@' cyc_cnt_cod, 
                    to_number('@defflg@') defflg, to_number('@rftflg@') rftflg, to_number('@voc_cod@') voc_cod, 
                    to_number('@reuse_locflg@') reuse_locflg, to_number('@unassign_flg@') unassign_flg, 
                    to_number('@stage_shpflg@') stage_shpflg
                    FROM dual) input 
         ON (c.codval = input.codval)
 WHEN NOT MATCHED THEN
     INSERT (codval, srtseq, reaflg, alctyp, cyc_cnt_cod, defflg, rftflg, voc_cod, reuse_locflg, unassign_flg, 
             stage_shpflg) 
     VALUES (input.codval, input.srtseq, input.reaflg, input.alctyp, input.cyc_cnt_cod, input.defflg, input.rftflg, input.voc_cod, 
             input.reuse_locflg, input.unassign_flg, input.stage_shpflg)]
