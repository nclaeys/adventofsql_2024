
with location_times as (select a.place_name, sl.timestamp from areas a, sleigh_locations sl where st_dwithin(a.polygon, sl.coordinate,1) and a.place_name != 'Lapland' order by timestamp asc),
     interval_times as (select lt.place_name, lt.timestamp as start_time, lead(lt.timestamp) over (order by lt.timestamp) as end_time from location_times lt),
     min_max as (select i.place_name, min(i.start_time) as start, max(i.end_time) as end from interval_times i group by i.place_name)
select m.place_name, m.start, EXTRACT(EPOCH FROM (m.end - m.start)) /3600 as duration_hours from min_max m;

