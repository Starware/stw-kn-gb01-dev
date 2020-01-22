[MERGE INTO ctry_mst c
      USING (SELECT '@ctry_name@' ctry_name, '@iso_2_ctry_name@' iso_2_ctry_name, '@iso_3_ctry_name@' iso_3_ctry_name,
                    '@iso_ctry_num@' iso_ctry_num, '@adr_fmt@' adr_fmt, '@dom_ld_acc_cd@' dom_ld_acc_cd, '@intl_acc_cd@' intl_acc_cd,
                    '@ctry_phone_cd@' ctry_phone_cd, '@cs_ctry_name@' cs_ctry_name, to_number('@zip_cod_len@') zip_cod_len,
                    '@dty_ctry_typ@' dty_ctry_typ, '@dty_ctry_cod@' dty_ctry_cod, '@grp_nam@' grp_nam
                    FROM dual) input
         ON (c.ctry_name = input.ctry_name)
 WHEN NOT MATCHED THEN
     INSERT (ctry_name, iso_2_ctry_name, iso_3_ctry_name, iso_ctry_num, adr_fmt, dom_ld_acc_cd, intl_acc_cd, ctry_phone_cd, cs_ctry_name,
             zip_cod_len, dty_ctry_typ, dty_ctry_cod, grp_nam)
     VALUES (input.ctry_name, input.iso_2_ctry_name, input.iso_3_ctry_name, input.iso_ctry_num, input.adr_fmt, input.dom_ld_acc_cd,
             input.intl_acc_cd, input.ctry_phone_cd, input.cs_ctry_name, input.zip_cod_len, input.dty_ctry_typ, input.dty_ctry_cod,
             input.grp_nam)]
