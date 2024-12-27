with gaps as (select id, lag(id) over(order by id) as previous_id from sequence_table order by id asc),
has_missing_values as (select id, previous_id from gaps where previous_id != id -1)
select id, previous_id, previous_id + 1 as gap_start, id -1 as gap_end, array(select generate_series(previous_id + 1, id -1 ,1)) as missing from has_missing_values;

