[MERGE INTO les_grid_config l
      USING (SELECT '@usr_id@' usr_id, '@locale_id@' locale_id, '@appl_id@' appl_id, '@frm_id@' frm_id, '@grid_nam@' grid_nam,
                    '@grid_fld_nam@' grid_fld_nam, to_number('@grid_fld_width@') grid_fld_width, to_number('@grid_fld_seq@') grid_fld_seq,
                    to_number('@grid_fld_vis@') grid_fld_vis, to_number('@srt_dir@') srt_dir, to_number('@srt_idx@') srt_idx,
                    '@grp_nam@' grp_nam
                    FROM dual) input
         ON (l.usr_id = input.usr_id
             AND l.locale_id = input.locale_id
             AND l.appl_id = input.appl_id
             AND l.frm_id = input.frm_id
             AND l.grid_nam = input.grid_nam
             AND l.grid_fld_nam = input.grid_fld_nam)
 WHEN NOT MATCHED THEN
     INSERT (usr_id, locale_id, appl_id, frm_id, grid_nam, grid_fld_nam, grid_fld_width, grid_fld_seq, grid_fld_vis, srt_dir, srt_idx,
             grp_nam)
     VALUES (input.usr_id, input.locale_id, input.appl_id, input.frm_id, input.grid_nam, input.grid_fld_nam, input.grid_fld_width,
             input.grid_fld_seq, input.grid_fld_vis, input.srt_dir, input.srt_idx, input.grp_nam)]
