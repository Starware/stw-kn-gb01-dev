[MERGE INTO les_layout l 
      USING (SELECT '@layout_id@' layout_id, @cust_lvl@ cust_lvl, to_number('@num_cols@') num_cols, to_number('@navigation@') navigation, 
                    to_number('@border_style@') border_style, to_number('@column_offset@') column_offset, 
                    to_number('@row_offset@') row_offset, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (l.layout_id = input.layout_id
             AND l.cust_lvl = input.cust_lvl)
 WHEN NOT MATCHED THEN
     INSERT (layout_id, cust_lvl, num_cols, navigation, border_style, column_offset, row_offset, grp_nam) 
     VALUES (input.layout_id, input.cust_lvl, input.num_cols, input.navigation, input.border_style, input.column_offset, input.row_offset, 
             input.grp_nam)]
