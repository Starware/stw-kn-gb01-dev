[MERGE INTO cardtl c 
      USING (SELECT '@carcod@' carcod, '@srvlvl@' srvlvl, '@srvlvl_nam@' srvlvl_nam, '@cartyp@' cartyp, 
                    to_number('@unt_ins_val@') unt_ins_val, to_number('@rel_val@') rel_val, '@rel_val_unt_typ@' rel_val_unt_typ, 
                    to_number('@sddflg@') sddflg, to_number('@intl_flg@') intl_flg, to_number('@fluid_load_flg@') fluid_load_flg, 
                    to_number('@bundle_flg@') bundle_flg, to_number('@booking_rqd_flg@') booking_rqd_flg, @shp_stg_ovrd_flg@ shp_stg_ovrd_flg, 
                    @single_pkg_shp_flg@ single_pkg_shp_flg, to_number('@max_wgt@') max_wgt, to_number('@max_vol@') max_vol, 
                    to_number('@max_val@') max_val, '@crncy_code@' crncy_code
                    FROM dual) input 
         ON (c.carcod = input.carcod
             AND c.srvlvl = input.srvlvl)
 WHEN NOT MATCHED THEN
     INSERT (carcod, srvlvl, srvlvl_nam, cartyp, unt_ins_val, rel_val, rel_val_unt_typ, sddflg, intl_flg, fluid_load_flg, bundle_flg, 
             booking_rqd_flg, shp_stg_ovrd_flg, single_pkg_shp_flg, max_wgt, max_vol, max_val, crncy_code) 
     VALUES (input.carcod, input.srvlvl, input.srvlvl_nam, input.cartyp, input.unt_ins_val, input.rel_val, input.rel_val_unt_typ, 
             input.sddflg, input.intl_flg, input.fluid_load_flg, input.bundle_flg, input.booking_rqd_flg, input.shp_stg_ovrd_flg, 
             input.single_pkg_shp_flg, input.max_wgt, input.max_vol, input.max_val, input.crncy_code)]