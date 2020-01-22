[select count(*) row_count
   from distro_typ
  where distro_typ = '@distro_typ@']
|
if (@row_count = 0)
{
    [insert 
      into distro_typ 
           (distro_typ,
            distro_rule_set,
            overage_rule_set,
            distro_timing,
            requir_tms_flg,
            distro_lead_time,
            adj_open_rec_flg)
      values
           ('@distro_typ@',
            '@distro_rule_set@',
            '@overage_rule_set@',
            '@distro_timing@',
            '@requir_tms_flg@',
            '@distro_lead_time@',
            '@adj_open_rec_flg@')]
}     
