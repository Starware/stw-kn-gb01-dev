[ select count(*) row_count
    from carxrf 
   where carcod = '@carcod@'
     and srvlvl = '@srvlvl@' 
     and dstnam = '@dstnam@' ]
|
if (@row_count = 0)
{
[ insert into carxrf
         (carcod, srvlvl, dstnam, dstcar, dstlvl, 
          tax_id, meter_num,
          prcl_pkgtyp, ground_flg, spr_adr_id, cod_adr_id,
          serv_prnt_lblflg, traknm_type, service_type) 
      values
         ('@carcod@', '@srvlvl@', '@dstnam@', '@dstcar@', '@dstlvl@',
          '@tax_id@', '@meter_num@', 
          '@prcl_pkgtyp@', to_number('@ground_flg@'), 
          '@spr_adr_id@', '@cod_adr_id@', to_number('@serv_prnt_lblflg@'), 
          '@traknm_type@', '@service_type@') ]
}

