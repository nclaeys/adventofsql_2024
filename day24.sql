with times_played as (select song_id, count(1) as number_of_plays from user_plays group by song_id),
     is_skipped as (select up.song_id, s.song_title, s.song_duration, up.duration, case when up.duration is null then 1 when up.duration < coalesce(s.song_duration, 0) then 1 else 0 end as is_skipped from user_plays up join songs s on s.song_id = up.song_id),
     times_skipped as (select song_id, song_title, SUM(is_skipped) as number_of_skips from is_skipped group by song_id, song_title)
select ts.song_id, ts.song_title, tp.number_of_plays, ts.number_of_skips from times_played tp join times_skipped ts on tp.song_id = ts.song_id join songs s on s.song_id = ts.song_id order by number_of_plays desc, number_of_skips asc limit 10
