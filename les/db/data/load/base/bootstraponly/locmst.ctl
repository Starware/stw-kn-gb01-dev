[MERGE INTO locmst l 
      USING (SELECT '@stoloc@' stoloc, '@wh_id@' wh_id, '@arecod@' arecod, '@loccod@' loccod, '@locsts@' locsts, '@velzon@' velzon, 
                    '@aisle_id@' aisle_id, '@trvseq@' trvseq, '@sto_seq@' sto_seq, to_number('@lochgt@') lochgt, to_number('@loclen@') loclen, to_number('@locwid@') locwid, 
                    to_number('@maxqvl@') maxqvl, to_number('@curqvl@') curqvl, to_number('@pndqvl@') pndqvl, 
                    to_number('@useflg@') useflg, to_number('@stoflg@') stoflg, to_number('@pckflg@') pckflg, to_number('@repflg@') repflg, 
                    to_number('@asgflg@') asgflg, to_number('@cipflg@') cipflg, '@locacc@' locacc, 
                    to_number('@perm_asgflg@') perm_asgflg, to_number('@cnt_zone_id@') cnt_zone_id, to_number('@pck_zone_id@') pck_zone_id, 
                    to_number('@sto_zone_id@') sto_zone_id, to_number('@mov_zone_id@') mov_zone_id, to_number('@wrk_zone_id@') wrk_zone_id, 
                    @loc_typ_id@ loc_typ_id, '@basepoint_id@' basepoint_id, 
                    to_number('@top_left_x@') top_left_x, to_number('@top_left_y@') top_left_y, to_number('@top_right_x@') top_right_x, 
                    to_number('@top_right_y@') top_right_y, to_number('@bottom_left_x@') bottom_left_x, 
                    to_number('@bottom_left_y@') bottom_left_y, to_number('@bottom_right_x@') bottom_right_x, 
                    to_number('@bottom_right_y@') bottom_right_y, to_number('@border_pad@') border_pad, 
                    @def_maxqvl@ def_maxqvl, nvl(to_number('@ateseq@'), 9999) ateseq,
                    to_date('@atedte@','YYYYMMDDHH24MISS') atedte, to_number('@cntbck_ena_flg@') cntbck_ena_flg, '@prdlin@' prdlin, 
                    '@stgloc@' stgloc, '@pal_stck_rst@' pal_stck_rst
                    FROM dual) input 
         ON (l.stoloc = input.stoloc
             AND l.wh_id = input.wh_id)
 WHEN NOT MATCHED THEN
     INSERT (stoloc, wh_id, arecod, loccod, locsts, velzon, aisle_id, trvseq, sto_seq, lochgt, loclen, locwid, 
             maxqvl, curqvl, pndqvl, useflg, stoflg, pckflg, repflg, asgflg, 
             cipflg, locacc, perm_asgflg, cnt_zone_id, pck_zone_id, sto_zone_id, mov_zone_id, wrk_zone_id, loc_typ_id, 
             basepoint_id, top_left_x, top_left_y, top_right_x, top_right_y, 
             bottom_left_x, bottom_left_y, bottom_right_x, bottom_right_y, border_pad, def_maxqvl, 
             ateseq, atedte, cntbck_ena_flg, prdlin, stgloc, pal_stck_rst) 
     VALUES (input.stoloc, input.wh_id, input.arecod, input.loccod, input.locsts, input.velzon, input.aisle_id, input.trvseq, 
             input.sto_seq, input.lochgt, input.loclen, input.locwid, input.maxqvl, input.curqvl, input.pndqvl, 
             input.useflg, input.stoflg, input.pckflg, input.repflg, input.asgflg, input.cipflg, input.locacc, input.perm_asgflg, input.cnt_zone_id, input.pck_zone_id, 
             input.sto_zone_id, input.mov_zone_id, input.wrk_zone_id, input.loc_typ_id, input.basepoint_id, input.top_left_x, 
             input.top_left_y, input.top_right_x, input.top_right_y, input.bottom_left_x, input.bottom_left_y, input.bottom_right_x, 
             input.bottom_right_y, input.border_pad, input.def_maxqvl, input.ateseq, 
             input.atedte, input.cntbck_ena_flg, input.prdlin, 
             input.stgloc, input.pal_stck_rst)]