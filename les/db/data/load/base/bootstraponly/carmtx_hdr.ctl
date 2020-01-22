[MERGE INTO carmtx_hdr c 
      USING (SELECT @carmtx_id@ carmtx_id, '@wh_id@' wh_id, @seqnum@ seqnum, '@carcod@' carcod, '@srvlvl@' srvlvl, '@cargrp@' cargrp
                    FROM dual) input 
         ON (c.carmtx_id = input.carmtx_id)
 WHEN NOT MATCHED THEN
     INSERT (carmtx_id, wh_id, seqnum, carcod, srvlvl, cargrp) 
     VALUES (input.carmtx_id, input.wh_id, input.seqnum, input.carcod, input.srvlvl, input.cargrp)]
