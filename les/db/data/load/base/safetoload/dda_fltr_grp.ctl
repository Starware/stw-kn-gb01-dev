[MERGE INTO dda_fltr_grp d 
      USING (SELECT '@fltr_grp@' fltr_grp, @cust_lvl@ cust_lvl, @srtseq@ srtseq, @grp_typ@ grp_typ, '@par_grp@' par_grp, 
                    '@attach_grp@' attach_grp, to_number('@attach_loc@') attach_loc, to_number('@attach_offset@') attach_offset, 
                    '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (d.fltr_grp = input.fltr_grp
             AND d.cust_lvl = input.cust_lvl)
 WHEN NOT MATCHED THEN
     INSERT (fltr_grp, cust_lvl, srtseq, grp_typ, par_grp, attach_grp, attach_loc, attach_offset, grp_nam) 
     VALUES (input.fltr_grp, input.cust_lvl, input.srtseq, input.grp_typ, input.par_grp, input.attach_grp, input.attach_loc, 
             input.attach_offset, input.grp_nam)]
;

create cache time stamp
 where obj_nam = "DDAFilterGroups"
   and idx_val = "LES"