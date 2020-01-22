[MERGE INTO dda_field d 
      USING (SELECT '@dda_id@' dda_id, @cust_lvl@ cust_lvl, '@dda_fld_typ@' dda_fld_typ, '@var_nam@' var_nam, to_number('@srtseq@') srtseq, 
                    '@link_dda_id@' link_dda_id, '@link_flds@' link_flds, to_number('@ena_flg@') ena_flg, to_number('@rqdflg@') rqdflg, 
                    '@grp_nam@' grp_nam, to_number('@dflt_flg@') dflt_flg, to_number('@dspl_only_flg@') dspl_only_flg, 
                    '@fltr_grp@' fltr_grp, '@ctxt_flds@' ctxt_flds, to_number('@pk_fld_flg@') pk_fld_flg, 
                    to_number('@pk_layout_flg@') pk_layout_flg, to_number('@aggr_func@') aggr_func
                    FROM dual) input 
         ON (d.dda_id = input.dda_id
             AND d.cust_lvl = input.cust_lvl
             AND d.dda_fld_typ = input.dda_fld_typ
             AND d.var_nam = input.var_nam)
 WHEN NOT MATCHED THEN
     INSERT (dda_id, cust_lvl, dda_fld_typ, var_nam, srtseq, link_dda_id, link_flds, ena_flg, rqdflg, grp_nam, dflt_flg, dspl_only_flg, 
             fltr_grp, ctxt_flds, pk_fld_flg, pk_layout_flg, aggr_func) 
     VALUES (input.dda_id, input.cust_lvl, input.dda_fld_typ, input.var_nam, input.srtseq, input.link_dda_id, input.link_flds, 
             input.ena_flg, input.rqdflg, input.grp_nam, input.dflt_flg, input.dspl_only_flg, input.fltr_grp, input.ctxt_flds, 
             input.pk_fld_flg, input.pk_layout_flg, input.aggr_func)]
;

create cache time stamp
 where obj_nam = "DDAFields"
   and idx_val = "LES"