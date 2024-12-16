with avg_reindeer as (select reindeer_id, exercise_name, ROUND(AVG(speed_record), 2) as avg_speed_record from Training_Sessions group by reindeer_id, exercise_name order by reindeer_id, exercise_name)
select r.reindeer_name, MAX(avg_speed_record) as max_avg_speed from avg_reindeer ar, Reindeers r where r.reindeer_id = ar.reindeer_id and r.reindeer_name != 'Rudolf' group by r.reindeer_id order by max_avg_speed desc
 limit 3;
