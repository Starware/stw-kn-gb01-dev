[MERGE INTO grid_dsp_rule g 
      USING (SELECT '@appl_id@' appl_id, '@frm_id@' frm_id, nvl('@lvl_id@', '----') lvl_id, '@grid_nam@' grid_nam, '@usr_id@' usr_id,
                    '@grid_fld_nam@' grid_fld_nam, @srt_seq@ srt_seq, '@dsp_rule_id@' dsp_rule_id, @cmp_opr@ cmp_opr, '@cmp_val@' cmp_val,
                    '@max_val@' max_val, to_number('@fore_color@') fore_color, to_number('@back_color@') back_color,
                    to_number('@fill_style@') fill_style, to_number('@fill_color@') fill_color, '@font_name@' font_name,
                    @font_bold@ font_bold, @font_italic@ font_italic, @font_strikethru@ font_strikethru, @font_underline@ font_underline,
                    @whole_row_flg@ whole_row_flg, to_number('@cmp_fld_flg@') cmp_fld_flg, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (g.appl_id = input.appl_id
             AND g.frm_id = input.frm_id
             AND g.lvl_id = input.lvl_id
             AND g.grid_nam = input.grid_nam
             AND g.usr_id = input.usr_id
             AND g.grid_fld_nam = input.grid_fld_nam
             AND g.srt_seq = input.srt_seq) 
 WHEN NOT MATCHED THEN
     INSERT (appl_id, frm_id, lvl_id, grid_nam, usr_id, grid_fld_nam, srt_seq, dsp_rule_id, cmp_opr, cmp_val, max_val, fore_color,
             back_color, fill_style, fill_color, font_name, font_bold, font_italic, font_strikethru, font_underline, whole_row_flg,
             cmp_fld_flg, grp_nam)
     VALUES (input.appl_id, input.frm_id, input.lvl_id, input.grid_nam, input.usr_id, input.grid_fld_nam, input.srt_seq, input.dsp_rule_id,
             input.cmp_opr, input.cmp_val, input.max_val, input.fore_color, input.back_color, input.fill_style, input.fill_color,
             input.font_name, input.font_bold, input.font_italic, input.font_strikethru, input.font_underline, input.whole_row_flg,
             input.cmp_fld_flg, input.grp_nam)]
