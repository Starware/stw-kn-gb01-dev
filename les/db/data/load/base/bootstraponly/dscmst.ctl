[MERGE INTO dscmst d
      USING (SELECT '@colnam@' colnam, '@colval@' colval, '@locale_id@' locale_id, '@lngdsc@' lngdsc, '@short_dsc@' short_dsc,
                    '@grp_nam@' grp_nam
                    FROM dual) input 
         ON (d.colnam = input.colnam
             AND d.colval = input.colval
             AND d.locale_id = input.locale_id)
  WHEN NOT MATCHED THEN
     INSERT (colnam, colval, locale_id, lngdsc, short_dsc, grp_nam)
     VALUES (input.colnam, input.colval, input.locale_id, input.lngdsc, input.short_dsc, input.grp_nam)]
;
create cache time stamp 
    where obj_nam = "dscmst-" || "@locale_id@"
      and idx_val = "LES"
;
invalidate description cache
    where colnam = '@colnam@'
      and locale_id = '@locale_id@'