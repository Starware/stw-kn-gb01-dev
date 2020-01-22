[MERGE INTO tree_node_config t 
      USING (SELECT '@node_typ@' node_typ, '@node_mode@' node_mode, @cust_lvl@ cust_lvl, decode('@child_list_cmd@','',NULL,'@child_list_cmd@') child_list_cmd, 
                    decode('@child_col@','',NULL,'@child_col@') child_col, decode('@desc_col@','',NULL,'@desc_col@') desc_col, decode('@child_typ@','',NULL,'@child_typ@') child_typ, decode('@child_typ_col@','',NULL,'@child_typ_col@') child_typ_col, 
                    decode('@img_id@','',NULL,'@img_id@') img_id, decode('@img_id_col@','',NULL,'@img_id_col@') img_id_col, decode('@exp_img_id@','',NULL,'@exp_img_id@') exp_img_id, decode('@exp_img_id_col@','',NULL,'@exp_img_id_col@') exp_img_id_col, 
                    decode('@sel_img_id@','',NULL,'@sel_img_id@') sel_img_id, decode('@sel_img_id_col@','',NULL,'@sel_img_id_col@') sel_img_id_col, decode('@par_flds@','',NULL,'@par_flds@') par_flds, decode('@node_ctrl@','',NULL,'@node_ctrl@') node_ctrl, 
                    decode('@node_list_cmd@','',NULL,'@node_list_cmd@') node_list_cmd, decode('@grp_nam@','',NULL,'@grp_nam@') grp_nam
                    FROM dual) input 
         ON (t.node_typ = input.node_typ
             AND t.node_mode = input.node_mode
             AND t.cust_lvl = input.cust_lvl) 
 WHEN NOT MATCHED THEN
     INSERT (node_typ, node_mode, cust_lvl, child_list_cmd, child_col, desc_col, child_typ, child_typ_col, img_id, img_id_col, exp_img_id, 
             exp_img_id_col, sel_img_id, sel_img_id_col, par_flds, node_ctrl, node_list_cmd, grp_nam) 
     VALUES (input.node_typ, input.node_mode, input.cust_lvl, input.child_list_cmd, input.child_col, input.desc_col, input.child_typ, 
             input.child_typ_col, input.img_id, input.img_id_col, input.exp_img_id, input.exp_img_id_col, input.sel_img_id, 
             input.sel_img_id_col, input.par_flds, input.node_ctrl, input.node_list_cmd, input.grp_nam)]
