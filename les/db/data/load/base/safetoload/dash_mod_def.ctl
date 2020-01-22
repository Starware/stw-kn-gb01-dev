[MERGE INTO dash_mod_def d
      USING (SELECT '@module_id@' module_id, '@module_typ@' module_typ, '@module_width@' module_width,
                    to_number('@module_height@') module_height, to_number('@refresh_sec@') refresh_sec, '@dash_dda_id@' dash_dda_id,
                    '@dda_qual@' dda_qual, '@opt_nam@' opt_nam, '@ws_wsdl@' ws_wsdl, '@ws_service@' ws_service, '@ws_port@' ws_port,
                    '@ws_wsml@' ws_wsml, '@ws_function@' ws_function, '@custom_subscribe@' custom_subscribe,
                    '@custom_unsubscribe@' custom_unsubscribe, '@moca_connect_str@' moca_connect_str, to_number('@multi_flg@') multi_flg,
                    '@session_quals@' session_quals, '@grp_nam@' grp_nam
                    FROM dual) input
         ON (d.module_id = input.module_id)
 WHEN NOT MATCHED THEN
     INSERT (module_id, module_typ, module_width, module_height, refresh_sec, dash_dda_id, dda_qual, opt_nam, ws_wsdl, ws_service, ws_port,
             ws_wsml, ws_function, custom_subscribe, custom_unsubscribe, moca_connect_str, multi_flg, session_quals, grp_nam)
     VALUES (input.module_id, input.module_typ, input.module_width, input.module_height, input.refresh_sec, input.dash_dda_id,
             input.dda_qual, input.opt_nam, input.ws_wsdl, input.ws_service, input.ws_port, input.ws_wsml, input.ws_function,
             input.custom_subscribe, input.custom_unsubscribe, input.moca_connect_str, input.multi_flg, input.session_quals, input.grp_nam)]
