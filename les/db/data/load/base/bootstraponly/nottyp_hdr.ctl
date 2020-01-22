[MERGE INTO nottyp_hdr n 
      USING (SELECT '@nottyp@' nottyp, to_number('@bill_print_flg@') bill_print_flg, to_number('@pack_print_flg@') pack_print_flg
                    FROM dual) input 
         ON (n.nottyp = input.nottyp) 
 WHEN NOT MATCHED THEN
     INSERT (nottyp, bill_print_flg, pack_print_flg) 
     VALUES (input.nottyp, input.bill_print_flg, input.pack_print_flg)]
