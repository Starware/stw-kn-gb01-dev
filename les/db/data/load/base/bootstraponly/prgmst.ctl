[MERGE INTO prgmst tbl
      USING (SELECT '@invsts_prg@' invsts_prg,
                    '@invsts@' invsts,
                    '@srtseq@' srtseq,
                    to_number('@alcflg@') alcflg,
                    to_number('@shpflg@') shpflg
               FROM dual) input
         ON (tbl.invsts_prg = input.invsts_prg
        AND tbl.invsts = input.invsts)
 WHEN NOT MATCHED THEN
     INSERT (invsts_prg,
             invsts,
             srtseq,
             alcflg,
             shpflg)
     VALUES (input.invsts_prg,
             input.invsts,
             input.srtseq,
             input.alcflg,
             input.shpflg)]
