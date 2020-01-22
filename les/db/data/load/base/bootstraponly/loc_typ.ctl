[MERGE INTO loc_typ l 
      USING (SELECT @loc_typ_id@ loc_typ_id, '@loc_typ@' loc_typ, '@loc_typ_cat@' loc_typ_cat, '@wh_id@' wh_id, to_number('@adjflg@') adjflg, 
                    @autclr_prcare@ autclr_prcare, to_number('@dispatch_flg@') dispatch_flg, to_number('@dstr_flg@') dstr_flg, 
                    to_number('@dstr_pck_ctn_flg@') dstr_pck_ctn_flg, to_number('@dstr_pck_pal_flg@') dstr_pck_pal_flg, to_number('@dstr_sug_ctn_flg@') dstr_sug_ctn_flg, 
                    to_number('@dstr_sug_pal_flg@') dstr_sug_pal_flg, to_number('@expflg@') expflg, to_number('@ftl_flg@') ftl_flg, to_number('@fwiflg@') fwiflg, to_number('@lpn_mix_flg@') lpn_mix_flg, 
                    to_number('@mix_shprcv_flg@') mix_shprcv_flg, to_number('@pck_to_sto_flg@') pck_to_sto_flg, to_number('@pdflg@') pdflg, to_number('@praflg@') praflg, 
                    to_number('@prd_stgflg@') prd_stgflg, to_number('@prod_flg@') prod_flg, to_number('@put_to_sto_flg@') put_to_sto_flg, to_number('@rcv_dck_flg@') rcv_dck_flg, 
                    to_number('@rcv_stgflg@') rcv_stgflg, to_number('@rdtflg@') rdtflg, to_number('@share_loc_flg@') share_loc_flg, 
                    to_number('@shp_dck_flg@') shp_dck_flg, to_number('@loc_ovrd_flg@') loc_ovrd_flg, to_number('@shpflg@') shpflg, to_number('@sigflg@') sigflg, to_number('@stgflg@') stgflg, 
                    to_number('@sto_trlr_flg@') sto_trlr_flg, to_number('@stoare_flg@') stoare_flg, to_number('@wip_expflg@') wip_expflg, to_number('@wip_supflg@') wip_supflg, 
                    to_number('@wipflg@') wipflg, to_number('@xdaflg@') xdaflg, to_number('@yrdflg@') yrdflg
                    FROM dual) input 
         ON (l.loc_typ_id = input.loc_typ_id) 
  WHEN NOT MATCHED THEN
     INSERT (loc_typ_id, loc_typ, loc_typ_cat, wh_id, adjflg, autclr_prcare, dispatch_flg, dstr_flg, dstr_pck_ctn_flg, 
             dstr_pck_pal_flg, dstr_sug_ctn_flg, dstr_sug_pal_flg, expflg, ftl_flg, fwiflg, lpn_mix_flg, mix_shprcv_flg, pck_to_sto_flg, 
             pdflg, praflg, prd_stgflg, prod_flg, put_to_sto_flg, rcv_dck_flg, rcv_stgflg, rdtflg, share_loc_flg, 
             shp_dck_flg, loc_ovrd_flg, shpflg, sigflg, stgflg, sto_trlr_flg, stoare_flg, wip_expflg, wip_supflg, wipflg, xdaflg, yrdflg) 
     VALUES (input.loc_typ_id, input.loc_typ, input.loc_typ_cat, input.wh_id, input.adjflg, input.autclr_prcare, 
             input.dispatch_flg, input.dstr_flg, input.dstr_pck_ctn_flg, input.dstr_pck_pal_flg, input.dstr_sug_ctn_flg, 
             input.dstr_sug_pal_flg, input.expflg, input.ftl_flg, input.fwiflg, input.lpn_mix_flg, input.mix_shprcv_flg, 
             input.pck_to_sto_flg, input.pdflg, input.praflg, input.prd_stgflg, input.prod_flg, input.put_to_sto_flg, input.rcv_dck_flg, 
             input.rcv_stgflg, input.rdtflg, input.share_loc_flg, input.shp_dck_flg, input.loc_ovrd_flg, 
             input.shpflg, input.sigflg, input.stgflg, input.sto_trlr_flg, input.stoare_flg, input.wip_expflg, input.wip_supflg, 
             input.wipflg, input.xdaflg, input.yrdflg)]
