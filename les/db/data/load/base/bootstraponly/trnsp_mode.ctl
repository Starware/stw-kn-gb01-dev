[MERGE INTO trnsp_mode t 
      USING (SELECT '@trnsp_mode@' trnsp_mode, to_number('@sml_pkg_flg@') sml_pkg_flg, to_number('@dir_flg@') dir_flg, 
                    to_number('@palletctl_flg@') palletctl_flg, sysdate ins_dt, sysdate last_upd_dt, 
                    'LOAD' ins_user_id, 'LOAD' last_upd_user_id, '@plbld_consol_by@' plbld_consol_by
                    FROM dual) input 
         ON (t.trnsp_mode = input.trnsp_mode) 
 WHEN NOT MATCHED THEN
     INSERT (trnsp_mode, sml_pkg_flg, dir_flg, palletctl_flg, ins_dt, last_upd_dt, ins_user_id, last_upd_user_id, 
             plbld_consol_by) 
     VALUES (input.trnsp_mode, input.sml_pkg_flg, input.dir_flg, input.palletctl_flg, input.ins_dt, input.last_upd_dt, 
             input.ins_user_id, input.last_upd_user_id, input.plbld_consol_by)]
