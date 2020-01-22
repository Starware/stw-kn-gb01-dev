[MERGE INTO dda_mst d 
      USING (SELECT '@dda_id@' dda_id, @cust_lvl@ cust_lvl, '@dda_typ@' dda_typ, '@dda_usage@' dda_usage, to_number('@topflg@') topflg, 
                    '@dda_cmd@' dda_cmd, '@dda_qual@' dda_qual, '@dda_init_qual@' dda_init_qual, '@dda_frm@' dda_frm, '@dda_img@' dda_img, 
                    '@init_cmd@' init_cmd, to_number(nvl('@cache_init_cols@', '1'))cache_init_cols, to_number('@rqdflg@') rqdflg, '@grp_nam@' grp_nam, 
                    '@sum_flds@' sum_flds, to_number('@excelflg@') excelflg, '@exceltmpl@' exceltmpl, '@reference@' reference, 
                    to_number('@tnw_typ@') tnw_typ, to_number('@grid_pos@') grid_pos, '@grid_prop@' grid_prop, 
                    to_number('@publish_data_flg@') publish_data_flg, to_number('@prof_crit_mode@') prof_crit_mode, 
                    to_number('@auto_find@') auto_find, '@xsl_file@' xsl_file
                    FROM dual) input 
         ON (d.dda_id = input.dda_id
             AND d.cust_lvl = input.cust_lvl)
 WHEN NOT MATCHED THEN
     INSERT (dda_id, cust_lvl, dda_typ, dda_usage, topflg, dda_cmd, dda_qual, dda_init_qual, dda_frm, dda_img, init_cmd, cache_init_cols, 
             rqdflg, grp_nam, sum_flds, excelflg, exceltmpl, reference, tnw_typ, grid_pos, grid_prop, publish_data_flg, prof_crit_mode, 
             auto_find, xsl_file) 
     VALUES (input.dda_id, input.cust_lvl, input.dda_typ, input.dda_usage, input.topflg, input.dda_cmd, input.dda_qual, 
             input.dda_init_qual, input.dda_frm, input.dda_img, input.init_cmd, input.cache_init_cols, input.rqdflg, input.grp_nam, 
             input.sum_flds, input.excelflg, input.exceltmpl, input.reference, input.tnw_typ, input.grid_pos, input.grid_prop, 
             input.publish_data_flg, input.prof_crit_mode, input.auto_find, input.xsl_file)]
;

create cache time stamp
 where obj_nam = "DDA"
   and idx_val = "LES"