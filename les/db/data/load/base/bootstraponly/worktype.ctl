list work types where worktype_id = '@worktype_id@' catch(-1403) 
| 
if (@? = 0) 
    {
    create work type
     where worktype_id = '@worktype_id@'
       and description = '@description@'
    }

