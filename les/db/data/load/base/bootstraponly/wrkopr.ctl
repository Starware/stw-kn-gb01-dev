[MERGE INTO wrkopr w 
      USING (SELECT '@oprcod@' oprcod, '@wh_id_tmpl@' wh_id_tmpl, @baspri@ baspri, to_number('@exptim@') exptim, 
                    to_number('@escinc@') escinc, to_number('@esc_shpdte_flg@') esc_shpdte_flg, '@esc_shpdte_field@' esc_shpdte_field, 
                    to_number('@maxescpri@') maxescpri, '@begdaycod@' begdaycod, to_date('@begtim@','YYYYMMDDHH24MISS') begtim, 
                    '@enddaycod@' enddaycod, to_date('@endtim@','YYYYMMDDHH24MISS') endtim, to_number('@use_src_flg@') use_src_flg, 
                    to_number('@esc_cmd_flg@') esc_cmd_flg, '@esc_cmd@' esc_cmd, '@rls_cmd@' rls_cmd, '@init_sts@' init_sts, 
                    to_number('@force_ack_loc_flg@') force_ack_loc_flg
                    FROM dual) input 
         ON (w.oprcod = input.oprcod
             AND w.wh_id_tmpl = input.wh_id_tmpl)
 WHEN NOT MATCHED THEN
     INSERT (oprcod, wh_id_tmpl, baspri, exptim, escinc, esc_shpdte_flg, esc_shpdte_field, maxescpri, begdaycod, begtim, enddaycod, endtim, 
             use_src_flg, esc_cmd_flg, esc_cmd, rls_cmd, init_sts, force_ack_loc_flg) 
     VALUES (input.oprcod, input.wh_id_tmpl, input.baspri, input.exptim, input.escinc, input.esc_shpdte_flg, input.esc_shpdte_field, 
             input.maxescpri, input.begdaycod, input.begtim, input.enddaycod, input.endtim, input.use_src_flg, input.esc_cmd_flg, 
             input.esc_cmd, input.rls_cmd, input.init_sts, input.force_ack_loc_flg)]
