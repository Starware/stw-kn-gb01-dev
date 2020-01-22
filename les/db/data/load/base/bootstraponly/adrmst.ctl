[MERGE INTO adrmst a
      USING (SELECT '@adr_id@' adr_id, '@client_id@' client_id, '@host_ext_id@' host_ext_id, '@adrnam@' adrnam, '@adrtyp@' adrtyp,
                    '@adrln1@' adrln1, '@adrln2@' adrln2, '@adrln3@' adrln3, '@adrcty@' adrcty, '@adrstc@' adrstc, '@adrpsz@' adrpsz,
                    '@ctry_name@' ctry_name, '@rgncod@' rgncod, '@phnnum@' phnnum, '@faxnum@' faxnum, '@attn_name@' attn_name,
                    '@attn_tel@' attn_tel, '@cont_name@' cont_name, '@cont_tel@' cont_tel, '@cont_title@' cont_title,
                    to_number('@rsaflg@') rsaflg, to_number('@temp_flg@') temp_flg, to_number('@po_box_flg@') po_box_flg,
                    '@last_name@' last_name, '@first_name@' first_name, '@honorific@' honorific, '@usr_dsp@' usr_dsp,
                    '@adr_district@' adr_district, '@web_adr@' web_adr, '@email_adr@' email_adr, '@pagnum@' pagnum,
                    '@locale_id@' locale_id, to_number('@pool_flg@') pool_flg, '@pool_rate_serv_nam@' pool_rate_serv_nam,
                    '@ship_phnnum@' ship_phnnum, '@ship_faxnum@' ship_faxnum, '@ship_web_adr@' ship_web_adr,
                    '@ship_email_adr@' ship_email_adr, '@ship_cont_name@' ship_cont_name, '@ship_cont_title@' ship_cont_title,
                    '@ship_cont_tel@' ship_cont_tel, '@ship_attn_name@' ship_attn_name, '@ship_attn_phnnum@' ship_attn_phnnum,
                    '@tim_zon_cd@' tim_zon_cd, '@rqst_state_cod@' rqst_state_cod, '@grp_nam@' grp_nam, '@latitude@' latitude,
                    '@longitude@' longitude, '@gln@' gln, '@cstms_site_typ@' cstms_site_typ, '@cstms_tx_site@' cstms_tx_site
                    FROM dual) input
         ON (a.adr_id = input.adr_id)
 WHEN NOT MATCHED THEN
     INSERT (adr_id, client_id, host_ext_id, adrnam, adrtyp, adrln1, adrln2, adrln3, adrcty, adrstc, adrpsz, ctry_name, rgncod, phnnum,
             faxnum, attn_name, attn_tel, cont_name, cont_tel, cont_title, rsaflg, temp_flg, po_box_flg, last_name, first_name, honorific,
             usr_dsp, adr_district, web_adr, email_adr, pagnum, locale_id, pool_flg, pool_rate_serv_nam, ship_phnnum, ship_faxnum,
             ship_web_adr, ship_email_adr, ship_cont_name, ship_cont_title, ship_cont_tel, ship_attn_name, ship_attn_phnnum, tim_zon_cd,
             rqst_state_cod, grp_nam, latitude, longitude, gln, cstms_site_typ, cstms_tx_site)
     VALUES (input.adr_id, input.client_id, input.host_ext_id, input.adrnam, input.adrtyp, input.adrln1, input.adrln2, input.adrln3,
             input.adrcty, input.adrstc, input.adrpsz, input.ctry_name, input.rgncod, input.phnnum, input.faxnum, input.attn_name,
             input.attn_tel, input.cont_name, input.cont_tel, input.cont_title, input.rsaflg, input.temp_flg, input.po_box_flg,
             input.last_name, input.first_name, input.honorific, input.usr_dsp, input.adr_district, input.web_adr, input.email_adr,
             input.pagnum, input.locale_id, input.pool_flg, input.pool_rate_serv_nam, input.ship_phnnum, input.ship_faxnum,
             input.ship_web_adr, input.ship_email_adr, input.ship_cont_name, input.ship_cont_title, input.ship_cont_tel,
             input.ship_attn_name, input.ship_attn_phnnum, input.tim_zon_cd, input.rqst_state_cod, input.grp_nam, input.latitude,
             input.longitude, input.gln, input.cstms_site_typ, input.cstms_tx_site)]
