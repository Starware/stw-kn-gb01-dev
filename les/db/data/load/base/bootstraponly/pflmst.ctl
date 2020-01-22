[ select count(*) row_count 
    from pflmst 
   where oprcod = '@oprcod@' 
     and prfnam = '@prfnam@' 
     and prftyp = '@prftyp@' 
     and srtseq = @srtseq@ ] | 
 
    if (@row_count = 0) 
    { 
          [ insert into pflmst 
              (oprcod, prfnam, prftyp, srtseq, prstr1, prstr2, grp_nam) 
            values 
              ('@oprcod@', '@prfnam@', '@prftyp@', @srtseq@, '@prstr1@', 
               '@prstr2@', '@grp_nam@') ]  
    }  

