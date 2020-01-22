[MERGE INTO pmsn_ctl_assoc tbl
      USING (SELECT '@pmsn_id@' pmsn_id,
                    '@appl_id@' appl_id,
                    '@frm_id@' frm_id,
                    '@ctrl_id@' ctrl_id,
                    '@pmsn_mask@' pmsn_mask,
                    to_number('@hid_flg@') hid_flg,
                    '@web_ctl_typ@' web_ctl_typ
               FROM dual) input
         ON (tbl.pmsn_id = input.pmsn_id
         and tbl.appl_id = input.appl_id 
         and tbl.frm_id = input.frm_id 
         and tbl.ctrl_id = input.ctrl_id)
 WHEN NOT MATCHED THEN
     INSERT (pmsn_id,
             appl_id,
             frm_id,
             ctrl_id,
             pmsn_mask,
             hid_flg,
             web_ctl_typ)
     VALUES (input.pmsn_id,
             input.appl_id,
             input.frm_id,
             input.ctrl_id,
             input.pmsn_mask,
             input.hid_flg,
             input.web_ctl_typ)]
