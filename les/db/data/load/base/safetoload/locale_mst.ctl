[MERGE INTO locale_mst l 
      USING (SELECT '@locale_id@' locale_id, '@ctry_name@' ctry_name, '@ora_lang@' ora_lang, '@ora_terr@' ora_terr, 
                    '@ora_nls_sort@' ora_nls_sort, to_number('@win_cli_lcid@') win_cli_lcid, to_number('@win_srv_lcid@') win_srv_lcid, 
                    '@unix_srv_locale_nam@' unix_srv_locale_nam, '@rf_locale_nam@' rf_locale_nam, '@mu_sys@' mu_sys, 
                    '@voc_lang_cod@' voc_lang_cod, '@grp_nam@' grp_nam, to_number('@ena_flg@') ena_flg
                    FROM dual) input 
         ON (l.locale_id = input.locale_id)
 WHEN NOT MATCHED THEN
     INSERT (locale_id, ctry_name, ora_lang, ora_terr, ora_nls_sort, win_cli_lcid, win_srv_lcid, unix_srv_locale_nam, rf_locale_nam, 
             mu_sys, voc_lang_cod, grp_nam, ena_flg)
     VALUES (input.locale_id, input.ctry_name, input.ora_lang, input.ora_terr, input.ora_nls_sort, input.win_cli_lcid, input.win_srv_lcid, 
             input.unix_srv_locale_nam, input.rf_locale_nam, input.mu_sys, input.voc_lang_cod, input.grp_nam, input.ena_flg)]
