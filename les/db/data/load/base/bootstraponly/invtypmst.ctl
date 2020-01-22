[MERGE INTO invtypmst i 
      USING (SELECT '@invtyp@' invtyp, to_number('@bill_anvstg_flg@') bill_anvstg_flg, to_number('@retflg@') retflg, to_number('@delvflg@') delvflg, 
                    to_number('@std_put_flg@') std_put_flg
                    FROM dual) input 
         ON (i.invtyp = input.invtyp)
 WHEN NOT MATCHED THEN
     INSERT (invtyp, bill_anvstg_flg, retflg, delvflg, std_put_flg) 
     VALUES (input.invtyp, input.bill_anvstg_flg, input.retflg, input.delvflg, input.std_put_flg)]
