[MERGE INTO popup_mnu p 
      USING (SELECT '@mnu_id@' mnu_id, '@item_id@' item_id, '@par_item_id@' par_item_id, '@mls_id@' mls_id, @type@ type, @posn@ posn, 
                    '@func@' func, '@parms@' parms, '@event@' event, @pmsns@ pmsns, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (p.mnu_id = input.mnu_id
             AND p.item_id = input.item_id
             AND p.par_item_id = input.par_item_id) 
 WHEN NOT MATCHED THEN
     INSERT (mnu_id, item_id, par_item_id, mls_id, type, posn, func, parms, event, pmsns, grp_nam) 
     VALUES (input.mnu_id, input.item_id, input.par_item_id, input.mls_id, input.type, input.posn, input.func, input.parms, input.event, 
             input.pmsns, input.grp_nam)]
