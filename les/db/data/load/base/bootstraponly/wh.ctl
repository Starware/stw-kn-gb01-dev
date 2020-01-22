[ select count(*) row_count
    from wh 
   where wh_id = '@wh_id@' ] 
   
  | 
  
  if (@row_count > 0) 
  { 
      [ insert into wh 
          (wh_id, adr_id, def_wh_flg, wh_typ_cd, lens_sitnam, lens_customer_id, lens_cust_client_id, lens_ena_flg, mod_usr_id, moddte) 
        values 
          ('@wh_id@', '@adr_id@', to_number('@def_wh_flg@'), '@wh_typ_cd@', '@lens_sitnam@', '@lens_customer_id@','@lens_cust_client_id@', to_number('@lens_ena_flg@'), '@mod_usr_id@',  to_date('@moddte@','YYYYMMDDHH24MISS'))  ]
  }  

