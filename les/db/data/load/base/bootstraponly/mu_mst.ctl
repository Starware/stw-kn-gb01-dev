[ select count(*) row_count 
    from mu_mst 
   where mu = '@mu@' 
] 
| 
if (@row_count = 0) 
{
    [ insert into mu_mst
            (mu, mu_cat, mu_sys, 
             cf_numerator, cf_denominator, ena_flg, dsp_precision, 		host_uom_cod,grp_nam)
        VALUES
            ('@mu@', '@mu_cat@', '@mu_sys@', 
             @cf_numerator@, @cf_denominator@, @ena_flg@, @dsp_precision@,
	    '@host_uom_cod@','@grp_nam@') 
    ] 
}

