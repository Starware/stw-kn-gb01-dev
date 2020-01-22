[MERGE INTO ctnmst c 
      USING (SELECT '@ctncod@' ctncod, '@wh_id@' wh_id, @ctnlen@ ctnlen, @ctnwid@ ctnwid, @ctnhgt@ ctnhgt, @ctnwgt@ ctnwgt, 
                    @ctnwlm@ ctnwlm, @ctnfpc@ ctnfpc, @last_ctn_fpc@ last_ctn_fpc, @pko_flg@ pko_flg 
                    FROM dual) input 
         ON (c.ctncod = input.ctncod
             AND c.wh_id = input.wh_id)
 WHEN NOT MATCHED THEN
     INSERT (ctncod, wh_id, ctnlen, ctnwid, ctnhgt, ctnwgt, ctnwlm, ctnfpc, last_ctn_fpc, pko_flg) 
     VALUES (input.ctncod, input.wh_id, input.ctnlen, input.ctnwid, input.ctnhgt, input.ctnwgt, input.ctnwlm, input.ctnfpc, 
             input.last_ctn_fpc, input.pko_flg)]
