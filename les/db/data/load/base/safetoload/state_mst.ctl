
[select count(*) row_count 
   from state_mst
  where ctry_name = upper('@ctry_name@')
    and adrstc = upper('@adrstc@') ]
| 
if (@row_count = 0) 
{
    create state
       where ctry_name = upper('@ctry_name@')
         and adrstc = upper('@adrstc@')
         and lngdsc = upper('@lngdsc@')
         and grp_nam = '@grp_nam@'
}
