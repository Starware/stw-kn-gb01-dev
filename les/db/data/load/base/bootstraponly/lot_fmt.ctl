[MERGE INTO lot_fmt l 
      USING (SELECT '@lot_fmt_id@' lot_fmt_id, to_number('@lot_dte_cod@') lot_dte_cod, '@raw_lot_fmt@' raw_lot_fmt, '@lot_valdt_cmd@' lot_valdt_cmd, 
                    '@lot_date_cmd@' lot_date_cmd
                    FROM dual) input 
         ON (l.lot_fmt_id = input.lot_fmt_id)
 WHEN NOT MATCHED THEN
     INSERT (lot_fmt_id, lot_dte_cod, raw_lot_fmt, lot_valdt_cmd, lot_date_cmd) 
     VALUES (input.lot_fmt_id, input.lot_dte_cod, input.raw_lot_fmt, input.lot_valdt_cmd, input.lot_date_cmd)]
