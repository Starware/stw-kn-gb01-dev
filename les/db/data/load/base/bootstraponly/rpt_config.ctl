[MERGE INTO rpt_config r 
      USING (SELECT '@rpt_id@' rpt_id, '@prod_id@' prod_id, '@rpt_layout_file@' rpt_layout_file, '@def_printer@' def_printer, 
                    '@rpt_typ@' rpt_typ, to_number('@keep_days@') keep_days, to_number('@ena_ems_flg@') ena_ems_flg, 
                    nvl(to_number('@dig_sig_req_flg@'), 0) dig_sig_req_flg, '@ems_evt_nam@' ems_evt_nam, '@func_area@' func_area, 
                    '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (r.rpt_id = input.rpt_id)
 WHEN NOT MATCHED THEN
     INSERT (rpt_id, prod_id, rpt_layout_file, def_printer, rpt_typ, keep_days, ena_ems_flg, dig_sig_req_flg, ems_evt_nam, func_area, 
             grp_nam) 
     VALUES (input.rpt_id, input.prod_id, input.rpt_layout_file, input.def_printer, input.rpt_typ, input.keep_days, input.ena_ems_flg, 
             input.dig_sig_req_flg, input.ems_evt_nam, input.func_area, input.grp_nam)] catch(-208, -942)
