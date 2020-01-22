[MERGE INTO trlr_plan t 
      USING (SELECT @trlr_plan_id@ trlr_plan_id, '@pallet_id_pctl@' pallet_id_pctl, '@wh_id@' wh_id, '@trlr_id@' trlr_id, 
                    '@car_move_id@' car_move_id, '@veh_num@' veh_num, to_number('@act_load_flg@') act_load_flg, '@pack_id@' pack_id, 
                    '@pack_typ@' pack_typ, to_number('@load_lgth@') load_lgth, to_number('@load_wid@') load_wid, 
                    to_number('@load_hgt@') load_hgt, '@load_dim_uom@' load_dim_uom, to_number('@load_wgt@') load_wgt, 
                    '@load_wgt_uom@' load_wgt_uom, to_number('@load_vol@') load_vol, '@load_vol_uom@' load_vol_uom, 
                    '@cont_type@' cont_type, '@cont_id@' cont_id, to_number('@wgt_util@') wgt_util, to_number('@vol_util@') vol_util, 
                    to_number('@mat_qty@') mat_qty, to_number('@pick_qty@') pick_qty, to_number('@sep_qty@') sep_qty, 
                    to_number('@lay_qty@') lay_qty, to_number('@lay_ptnl@') lay_ptnl, to_number('@pick_path@') pick_path, 
                    '@pick_path_uom@' pick_path_uom, to_number('@pick_time@') pick_time, '@pick_time_uom@' pick_time_uom, 
                    to_number('@front_axle_wgt@') front_axle_wgt, to_number('@back_axle_wgt@') back_axle_wgt, 
                    '@axle_wgt_uom@' axle_wgt_uom, '@package_typ@' package_typ, to_number('@dg_flg@') dg_flg, '@vso_id@' vso_id, 
                    to_number('@open_floor_spots@') open_floor_spots, to_number('@floor_spot_util1@') floor_spot_util1, 
                    to_number('@floor_spot_util2@') floor_spot_util2, to_number('@max_flr_spots@') max_flr_spots, 
                    to_number('@max_flr_spots_calc@') max_flr_spots_calc, to_number('@block_id@') block_id, 
                    '@pallet_pos_pctl@' pallet_pos_pctl, '@pallet_num_pctl@' pallet_num_pctl, 
                    to_number('@min_trlr_axle_pos@') min_trlr_axle_pos, to_number('@max_trlr_axle_pos@') max_trlr_axle_pos, 
                    to_number('@front_axle_pos@') front_axle_pos, '@orientation_pctl@' orientation_pctl, '@pallet_class@' pallet_class, 
                    to_number('@pallet_pos_ovr_flg@') pallet_pos_ovr_flg, '@pallet_pos_ovr_cod@' pallet_pos_ovr_cod
                    FROM dual) input 
         ON (t.trlr_plan_id = input.trlr_plan_id
             AND t.pallet_id_pctl = input.pallet_id_pctl
             AND t.wh_id = input.wh_id) 
 WHEN NOT MATCHED THEN
     INSERT (trlr_plan_id, pallet_id_pctl, wh_id, trlr_id, car_move_id, veh_num, act_load_flg, pack_id, pack_typ, load_lgth, load_wid, 
             load_hgt, load_dim_uom, load_wgt, load_wgt_uom, load_vol, load_vol_uom, cont_type, cont_id, wgt_util, vol_util, mat_qty, 
             pick_qty, sep_qty, lay_qty, lay_ptnl, pick_path, pick_path_uom, pick_time, pick_time_uom, front_axle_wgt, back_axle_wgt, 
             axle_wgt_uom, package_typ, dg_flg, vso_id, open_floor_spots, floor_spot_util1, floor_spot_util2, max_flr_spots, 
             max_flr_spots_calc, block_id, pallet_pos_pctl, pallet_num_pctl, min_trlr_axle_pos, max_trlr_axle_pos, front_axle_pos, 
             orientation_pctl, pallet_class, pallet_pos_ovr_flg, pallet_pos_ovr_cod) 
     VALUES (input.trlr_plan_id, input.pallet_id_pctl, input.wh_id, input.trlr_id, input.car_move_id, input.veh_num, input.act_load_flg, 
             input.pack_id, input.pack_typ, input.load_lgth, input.load_wid, input.load_hgt, input.load_dim_uom, input.load_wgt, 
             input.load_wgt_uom, input.load_vol, input.load_vol_uom, input.cont_type, input.cont_id, input.wgt_util, input.vol_util, 
             input.mat_qty, input.pick_qty, input.sep_qty, input.lay_qty, input.lay_ptnl, input.pick_path, input.pick_path_uom, 
             input.pick_time, input.pick_time_uom, input.front_axle_wgt, input.back_axle_wgt, input.axle_wgt_uom, input.package_typ, 
             input.dg_flg, input.vso_id, input.open_floor_spots, input.floor_spot_util1, input.floor_spot_util2, input.max_flr_spots, 
             input.max_flr_spots_calc, input.block_id, input.pallet_pos_pctl, input.pallet_num_pctl, input.min_trlr_axle_pos, 
             input.max_trlr_axle_pos, input.front_axle_pos, input.orientation_pctl, input.pallet_class, input.pallet_pos_ovr_flg, 
             input.pallet_pos_ovr_cod)]
