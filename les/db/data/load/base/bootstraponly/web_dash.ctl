[ select count(*) row_count from web_dash
	where dash_id = '@dash_id@'] | if (@row_count = 0) {
	
	[ insert into web_dash
                      (dash_id, dash_typ, dash_width, dash_height, dda_id, dda_qual, ws_wsdl, ws_service, ws_port, ws_wsml, ws_function, moca_connect_str, custom_subscribe, custom_unsubscribe, multi_flg, grp_nam)
                      VALUES
                      ('@dash_id@', '@dash_typ@', '@dash_width@', to_number('@dash_height@'), '@dda_id@', '@dda_qual@', '@ws_wsdl@', '@ws_service@', '@ws_port@', '@ws_wsml@', '@ws_function@', '@moca_connect_str@', '@custom_subscribe@', '@custom_unsubscribe@', '@multi_flg@', '@grp_nam@')]
        }

