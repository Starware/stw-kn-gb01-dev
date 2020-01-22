[select count(*) row_count
   from dock_slot
  where slot_id = '@slot_id@'
    and wh_id   = '@wh_id@']
|
if (@row_count = 0)
{
    [insert
       into dock_slot
            (slot_id, wh_id, arecod)
     values
            ('@slot_id@', '@wh_id@', '@arecod@')]
}

