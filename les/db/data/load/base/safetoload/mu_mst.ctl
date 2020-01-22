[MERGE INTO mu_mst m 
      USING (SELECT '@mu@' mu, '@mu_cat@' mu_cat, '@mu_sys@' mu_sys, @cf_numerator@ cf_numerator, @cf_denominator@ cf_denominator, 
                    @dsp_precision@ dsp_precision, @ena_flg@ ena_flg, '@host_uom_cod@' host_uom_cod, '@grp_nam@' grp_nam, 
                    '@un_cefact_cod@' un_cefact_cod
                    FROM dual) input 
         ON (m.mu = input.mu)
 WHEN NOT MATCHED THEN
     INSERT (mu, mu_cat, mu_sys, cf_numerator, cf_denominator, dsp_precision, ena_flg, host_uom_cod, grp_nam, un_cefact_cod) 
     VALUES (input.mu, input.mu_cat, input.mu_sys, input.cf_numerator, input.cf_denominator, input.dsp_precision, input.ena_flg, 
             input.host_uom_cod, input.grp_nam, input.un_cefact_cod)]
