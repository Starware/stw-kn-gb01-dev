[select count(*) row_count
    from pko_flds_default
    where colnam = '@colnam@'
      and wh_id = '@wh_id@'
      and aud_typ = '@aud_typ@']
|
if (@row_count = 0) {
 generate next number
       where numcod = 'pko_flds_default_id'
    |
    [insert into pko_flds_default
          (pko_flds_default_id, colnam, wh_id, srtseq, id_fld_flg, bc_fld_flg, ins_dt, last_upd_dt, ins_user_id, last_upd_user_id, auto_fill_flg, vis_flg, aud_typ)
     values
          (@nxtnum, '@colnam@', '@wh_id@', @srtseq@, @id_fld_flg@, @bc_fld_flg@, to_date('@ins_dt@','YYYYMMDDHH24MISS'), to_date('@last_upd_dt@','YYYYMMDDHH24MISS'), '@ins_user_id@', '@last_upd_user_id@', to_number('@auto_fill_flg@'), to_number('@vis_flg@'), '@aud_typ@')]

}

