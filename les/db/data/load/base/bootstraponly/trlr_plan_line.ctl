[MERGE INTO trlr_plan_line t 
      USING (SELECT @trlr_plan_id@ trlr_plan_id, @trlr_plan_line_id@ trlr_plan_line_id, '@packing_id@' packing_id, 
                    to_number('@pack_pos_num@') pack_pos_num, to_number('@seq_num@') seq_num, to_number('@layer_num@') layer_num, 
                    '@pack_pos_typ@' pack_pos_typ, '@material_num@' material_num, to_number('@qty@') qty, '@basis_unit@' basis_unit, 
                    to_number('@lgth@') lgth, to_number('@wid@') wid, to_number('@hgt@') hgt, '@dim_uom@' dim_uom, to_number('@wgt@') wgt, 
                    '@wgt_uom@' wgt_uom, to_number('@vol@') vol, '@vol_uom@' vol_uom, '@orientation@' orientation, 
                    '@delivery_num@' delivery_num, '@delivery_pos_num@' delivery_pos_num, '@pack_id@' pack_id, 
                    to_number('@qty_factor@') qty_factor, '@pallet_pos_pctl@' pallet_pos_pctl, '@pallet_num_pctl@' pallet_num_pctl, 
                    '@pallet_id_pctl@' pallet_id_pctl, '@orig_cart_id@' orig_cart_id, '@alloc_num@' alloc_num, '@work_req_id@' work_req_id, 
                    '@picked_lpn@' picked_lpn, to_number('@sngl_prt_pal_flg@') sngl_prt_pal_flg
                    FROM dual) input 
         ON (t.trlr_plan_id = input.trlr_plan_id
             AND t.trlr_plan_line_id = input.trlr_plan_line_id) 
 WHEN NOT MATCHED THEN
     INSERT (trlr_plan_id, trlr_plan_line_id, packing_id, pack_pos_num, seq_num, layer_num, pack_pos_typ, material_num, qty, basis_unit, 
             lgth, wid, hgt, dim_uom, wgt, wgt_uom, vol, vol_uom, orientation, delivery_num, delivery_pos_num, pack_id, qty_factor, 
             pallet_pos_pctl, pallet_num_pctl, pallet_id_pctl, orig_cart_id, alloc_num, work_req_id, picked_lpn, sngl_prt_pal_flg) 
     VALUES (input.trlr_plan_id, input.trlr_plan_line_id, input.packing_id, input.pack_pos_num, input.seq_num, input.layer_num, 
             input.pack_pos_typ, input.material_num, input.qty, input.basis_unit, input.lgth, input.wid, input.hgt, input.dim_uom, 
             input.wgt, input.wgt_uom, input.vol, input.vol_uom, input.orientation, input.delivery_num, input.delivery_pos_num, 
             input.pack_id, input.qty_factor, input.pallet_pos_pctl, input.pallet_num_pctl, input.pallet_id_pctl, input.orig_cart_id, 
             input.alloc_num, input.work_req_id, input.picked_lpn, input.sngl_prt_pal_flg)]
