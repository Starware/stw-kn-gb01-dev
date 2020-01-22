[MERGE INTO pck_zone tbl
      USING (SELECT '@pck_zone_id@' pck_zone_id, 
                    '@pck_zone_cod@' pck_zone_cod, 
                    '@bldg_id@' bldg_id, 
                    '@wh_id@' wh_id, 
                    '@atecod@' atecod, 
                    '@ctngrp@' ctngrp, 
                    to_number('@dtlflg@') dtlflg, 
                    to_number('@subflg@') subflg, 
                    to_number('@lodflg@') lodflg, 
                    to_number('@pck_steal_flg@') pck_steal_flg,
                    to_number('@start_pal_flg@') start_pal_flg, 
                    to_number('@pipflg@') pipflg
               FROM dual) input
         ON (tbl.pck_zone_id = input.pck_zone_id)
 WHEN NOT MATCHED THEN
     INSERT (pck_zone_id,
             pck_zone_cod,
             bldg_id,
             wh_id,
             atecod,
             ctngrp,
             dtlflg,
             subflg,
             lodflg,
             pck_steal_flg,
             start_pal_flg,
             pipflg)
     VALUES (input.pck_zone_id,
             input.pck_zone_cod,
             input.bldg_id,
             input.wh_id,
             input.atecod,
             input.ctngrp,
             input.dtlflg,
             input.subflg,
             input.lodflg,
             input.pck_steal_flg,
             input.start_pal_flg,
             input.pipflg)]
             