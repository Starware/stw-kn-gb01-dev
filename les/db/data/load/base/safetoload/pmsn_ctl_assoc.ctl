[MERGE INTO pmsn_ctl_assoc p 
      USING (SELECT '@pmsn_id@' pmsn_id, '@appl_id@' appl_id, '@frm_id@' frm_id, '@ctrl_id@' ctrl_id, @pmsn_mask@ pmsn_mask, 
                    @hid_flg@ hid_flg, '@web_ctl_typ@' web_ctl_typ
                    FROM dual) input 
         ON (p.pmsn_id = input.pmsn_id
             AND p.appl_id = input.appl_id
             AND p.frm_id = input.frm_id
             AND p.ctrl_id = input.ctrl_id)
 WHEN NOT MATCHED THEN
     INSERT (pmsn_id, appl_id, frm_id, ctrl_id, pmsn_mask, hid_flg, web_ctl_typ) 
     VALUES (input.pmsn_id, input.appl_id, input.frm_id, input.ctrl_id, input.pmsn_mask, input.hid_flg, input.web_ctl_typ)]
