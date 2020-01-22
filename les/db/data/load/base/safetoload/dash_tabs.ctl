[MERGE INTO dash_tabs d
      USING (SELECT '@tab_id@' tab_id, @template_flg@ template_flg, '@grp_nam@' grp_nam
                    FROM dual) input
         ON (d.tab_id = input.tab_id)
 WHEN NOT MATCHED THEN
     INSERT (tab_id, template_flg, grp_nam)
     VALUES (input.tab_id, input.template_flg, input.grp_nam)]
