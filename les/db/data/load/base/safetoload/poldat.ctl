if ('@wh_id_tmpl@' = '')
{
    publish data where wh_id_tmpl = '----'
}
else
{
    publish data where wh_id_tmpl = '@wh_id_tmpl@'
}
|
[ select count(*) row_count
    from poldat 
   where polcod = '@polcod@' 
     and polvar = '@polvar@' 
     and polval = '@polval@' 
     and srtseq = @srtseq@
     and wh_id_tmpl = @wh_id_tmpl ] 
 | 
 if (@row_count = 0) 
 {
    create policy  
        where polcod = '@polcod@' 
	  and polvar = '@polvar@'           
	  and polval = '@polval@'           
	  and srtseq = @srtseq@           
	  and rtstr1 = '@rtstr1@'           
	  and rtstr2 = '@rtstr2@'           
	  and rtnum1 = int('@rtnum1@')           
	  and rtnum2 = int('@rtnum2@')           
	  and rtflt1 = float('@rtflt1@')           
	  and rtflt2 = float('@rtflt2@')           
	  and grp_nam = '@grp_nam@'
	  and wh_id = @wh_id_tmpl
  
  }
