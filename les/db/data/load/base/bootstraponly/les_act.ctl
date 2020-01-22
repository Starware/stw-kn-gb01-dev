[MERGE INTO les_act l 
      USING (SELECT '@act_key@' act_key, @cust_lvl@ cust_lvl, @act_pmsns@ act_pmsns, '@act_typ@' act_typ, '@comp@' comp, '@func@' func, 
                    '@parm1@' parm1, '@parm2@' parm2, '@parm3@' parm3, '@parm4@' parm4, '@parm5@' parm5, '@nxt_act@' nxt_act, 
                    '@ret_fld@' ret_fld, '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (l.act_key = input.act_key
             AND l.cust_lvl = input.cust_lvl)
 WHEN NOT MATCHED THEN
     INSERT (act_key, cust_lvl, act_pmsns, act_typ, comp, func, parm1, parm2, parm3, parm4, parm5, nxt_act, ret_fld, grp_nam) 
     VALUES (input.act_key, input.cust_lvl, input.act_pmsns, input.act_typ, input.comp, input.func, input.parm1, input.parm2, input.parm3, 
             input.parm4, input.parm5, input.nxt_act, input.ret_fld, input.grp_nam)]
|
   create cache time stamp
    where obj_nam = "MCSActions"
      and idx_val = "LES"