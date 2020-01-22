[ select count(*) row_count 
    from les_nav_bar_tab 
   where nav_bar_id = '@nav_bar_id@' ] | 
    if (@row_count = 0) 
    {
        create navigation bar tab
          where mnu_grp = '@mnu_grp@'
            and nav_bar_id = '@nav_bar_id@'
            and all_usrs_flg = @all_usrs_flg@
            and srt_seq = @srt_seq
            and grp_nam = '@grp_nam@'
    }

