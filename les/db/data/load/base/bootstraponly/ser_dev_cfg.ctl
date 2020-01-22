[MERGE INTO ser_dev_cfg s 
      USING (SELECT '@ser_dev_id@' ser_dev_id, '@wh_id@' wh_id, '@ser_dev_typ@' ser_dev_typ, '@ser_port@' ser_port, @baudrate@ baudrate, 
                    @databits@ databits, '@parity@' parity, '@stopbits@' stopbits, '@scanner_encoding@' scanner_encoding, 
                    to_number('@scanner_wait_time@') scanner_wait_time, to_number('@scanner_delay_time@') scanner_delay_time, 
                    to_date('@ins_dt@','YYYYMMDDHH24MISS') ins_dt, to_date('@last_upd_dt@','YYYYMMDDHH24MISS') last_upd_dt, 
                    '@ins_user_id@' ins_user_id, '@last_upd_user_id@' last_upd_user_id
                    FROM dual) input 
         ON (s.ser_dev_id = input.ser_dev_id
             AND s.wh_id = input.wh_id)
 WHEN NOT MATCHED THEN
     INSERT (ser_dev_id, wh_id, ser_dev_typ, ser_port, baudrate, databits, parity, stopbits, scanner_encoding, scanner_wait_time, 
             scanner_delay_time, ins_dt, last_upd_dt, ins_user_id, last_upd_user_id) 
     VALUES (input.ser_dev_id, input.wh_id, input.ser_dev_typ, input.ser_port, input.baudrate, input.databits, input.parity, 
             input.stopbits, input.scanner_encoding, input.scanner_wait_time, input.scanner_delay_time, input.ins_dt, input.last_upd_dt, 
             input.ins_user_id, input.last_upd_user_id)]
