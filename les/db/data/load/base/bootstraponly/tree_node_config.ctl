[ select count(*) row_count from tree_node_config where
    node_typ = '@node_typ@' and node_mode = '@node_mode@' and cust_lvl = @cust_lvl@ ] | if (@row_count > 0) {
	
	[ insert into tree_node_config
                      (node_typ, node_mode, cust_lvl, child_list_cmd, child_col, desc_col, child_typ, child_typ_col, img_id, img_id_col, par_flds, node_ctrl, node_list_cmd, grp_nam)
                      VALUES
                      ('@node_typ@', '@node_mode@', @cust_lvl@, '@child_list_cmd@', '@child_col@', '@desc_col@', '@child_typ@', '@child_typ_col@', '@img_id@', '@img_id_col@', '@par_flds@', '@node_ctrl@', '@node_list_cmd@', '@grp_nam@') ]
        }
