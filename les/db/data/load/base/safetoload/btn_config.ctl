[MERGE INTO btn_config b 
      USING (SELECT '@btn_key@' btn_key, @cust_lvl@ cust_lvl, @type@ type, @style@ style, @posn@ posn, '@func@' func, '@parms@' parms, 
                    '@event@' event, @pmsns@ pmsns, '@caption_id@' caption_id, '@img_id@' img_id, '@dis_img_id@' dis_img_id, 
                    '@hot_img_id@' hot_img_id, '@ttip_txt_id@' ttip_txt_id, @cause_valdt@ cause_valdt, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (b.btn_key = input.btn_key
             AND b.cust_lvl = input.cust_lvl)
 WHEN NOT MATCHED THEN
     INSERT (btn_key, cust_lvl, type, style, posn, func, parms, event, pmsns, caption_id, img_id, dis_img_id, hot_img_id, ttip_txt_id, 
             cause_valdt, grp_nam) 
     VALUES (input.btn_key, input.cust_lvl, input.type, input.style, input.posn, input.func, input.parms, input.event, input.pmsns, 
             input.caption_id, input.img_id, input.dis_img_id, input.hot_img_id, input.ttip_txt_id, input.cause_valdt, input.grp_nam)]
|
create cache time stamp
 where obj_nam = "ButtonBar"
   and idx_val = 'LES'
|
   create cache time stamp
     where obj_nam = "MCSToolbar"
       and idx_val = "LES"