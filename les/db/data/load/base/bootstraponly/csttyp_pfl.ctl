[MERGE INTO csttyp_pfl c 
      USING (SELECT '@csttyp@' csttyp, '@frscod@' frscod, to_number('@min_shelf_hrs@') min_shelf_hrs, '@invsts_prg@' invsts_prg, 
                    '@shplbl@' shplbl, '@shipby@' shipby, '@cargrp@' cargrp, '@manfid@' manfid, '@deptno@' deptno, '@ordinv@' ordinv, 
                    '@rsvpri@' rsvpri, '@requir_tms_cod@' requir_tms_cod, '@pltbld_consby@' pltbld_consby, 
                    '@lod_tag_sngle_encode@' lod_tag_sngle_encode, '@lod_tag_mix_encode@' lod_tag_mix_encode, 
                    '@sub_tag_sngle_encode@' sub_tag_sngle_encode, '@sub_tag_mix_encode@' sub_tag_mix_encode, '@urn_format@' urn_format, 
                    '@grp_nam@' grp_nam, to_number('@early_dlv_thresh@') early_dlv_thresh, to_number('@late_dlv_thresh@') late_dlv_thresh, 
                    to_number('@ord_split_flg@') ord_split_flg, to_number('@line_split_flg@') line_split_flg, 
                    to_number('@ovr_shp_tol@') ovr_shp_tol, to_number('@ovr_shp_tol_pct@') ovr_shp_tol_pct, 
                    to_number('@und_shp_tol@') und_shp_tol, to_number('@und_shp_tol_pct@') und_shp_tol_pct, 
                    '@transit_serv_id@' transit_serv_id, to_number('@sf_ovr_flg@') sf_ovr_flg, 
                    to_number('@early_dlv_thresh_flg@') early_dlv_thresh_flg, '@load_attr1_cfg@' load_attr1_cfg, 
                    '@load_attr2_cfg@' load_attr2_cfg, '@load_attr3_cfg@' load_attr3_cfg, '@load_attr4_cfg@' load_attr4_cfg, 
                    '@load_attr5_cfg@' load_attr5_cfg, to_number('@late_dlv_thresh_flg@') late_dlv_thresh_flg, 
                    '@und_shp_tol_cod@' und_shp_tol_cod, '@ovr_shp_tol_cod@' ovr_shp_tol_cod, '@shp_mod_rule_cod@' shp_mod_rule_cod, 
                    '@alc_search_path@' alc_search_path, to_number('@abs_ordinv_win@') abs_ordinv_win, '@abs_ordinv_code@' abs_ordinv_code,
                    nvl(to_number('@bulk_pck_flg@'), 1) bulk_pck_flg, to_number('@xdkflg@') xdkflg
                    FROM dual) input 
         ON (c.csttyp = input.csttyp)
 WHEN NOT MATCHED THEN
     INSERT (csttyp, frscod, min_shelf_hrs, invsts_prg, shplbl, shipby, cargrp, manfid, deptno, ordinv, rsvpri, requir_tms_cod, 
             pltbld_consby, lod_tag_sngle_encode, lod_tag_mix_encode, sub_tag_sngle_encode, sub_tag_mix_encode, urn_format, grp_nam, 
             early_dlv_thresh, late_dlv_thresh, ord_split_flg, line_split_flg, ovr_shp_tol, ovr_shp_tol_pct, und_shp_tol, und_shp_tol_pct, 
             transit_serv_id, sf_ovr_flg, early_dlv_thresh_flg, load_attr1_cfg, load_attr2_cfg, load_attr3_cfg, load_attr4_cfg, 
             load_attr5_cfg, late_dlv_thresh_flg, und_shp_tol_cod, ovr_shp_tol_cod, shp_mod_rule_cod, alc_search_path, abs_ordinv_win, 
             abs_ordinv_code, bulk_pck_flg, xdkflg) 
     VALUES (input.csttyp, input.frscod, input.min_shelf_hrs, input.invsts_prg, input.shplbl, input.shipby, input.cargrp, input.manfid, 
             input.deptno, input.ordinv, input.rsvpri, input.requir_tms_cod, input.pltbld_consby, input.lod_tag_sngle_encode, 
             input.lod_tag_mix_encode, input.sub_tag_sngle_encode, input.sub_tag_mix_encode, input.urn_format, input.grp_nam, 
             input.early_dlv_thresh, input.late_dlv_thresh, input.ord_split_flg, input.line_split_flg, input.ovr_shp_tol, 
             input.ovr_shp_tol_pct, input.und_shp_tol, input.und_shp_tol_pct, input.transit_serv_id, input.sf_ovr_flg, 
             input.early_dlv_thresh_flg, input.load_attr1_cfg, input.load_attr2_cfg, input.load_attr3_cfg, input.load_attr4_cfg, 
             input.load_attr5_cfg, input.late_dlv_thresh_flg, input.und_shp_tol_cod, input.ovr_shp_tol_cod, input.shp_mod_rule_cod, 
             input.alc_search_path, input.abs_ordinv_win, input.abs_ordinv_code, input.bulk_pck_flg, input.xdkflg)]
