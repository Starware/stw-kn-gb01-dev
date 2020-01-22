[MERGE INTO dda_child d 
      USING (SELECT '@dda_id@' dda_id, '@dda_typ@' dda_typ, '@dda_child_id@' dda_child_id, '@dda_child_typ@' dda_child_typ, 
                    @cust_lvl@ cust_lvl, '@child_flds@' child_flds, to_number('@srtseq@') srtseq, to_number('@ena_flg@') ena_flg, 
                    to_number('@init_vis_flg@') init_vis_flg, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (d.dda_id = input.dda_id
             AND d.dda_typ = input.dda_typ
             AND d.dda_child_id = input.dda_child_id
             AND d.dda_child_typ = input.dda_child_typ
             AND d.cust_lvl = input.cust_lvl)
 WHEN NOT MATCHED THEN
     INSERT (dda_id, dda_typ, dda_child_id, dda_child_typ, cust_lvl, child_flds, srtseq, ena_flg, init_vis_flg, grp_nam) 
     VALUES (input.dda_id, input.dda_typ, input.dda_child_id, input.dda_child_typ, input.cust_lvl, input.child_flds, input.srtseq, 
             input.ena_flg, input.init_vis_flg, input.grp_nam)]
;

create cache time stamp
 where obj_nam = "DDAChild"
   and idx_val = "LES"