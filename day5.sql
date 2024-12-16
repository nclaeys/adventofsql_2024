WITH window_cte as (select toy_production.production_date, toy_production.toys_produced, lag(toys_produced) over (order by toy_production.production_date asc) as previous_day_production from toy_production)
select w.production_date, w.toys_produced, w.previous_day_production, w.toys_produced - w.previous_day_production as diff, ROUND(cast(cast(w.toys_produced - w.previous_day_production AS FLOAT)/CAST(w.previous_day_production AS FLOAT) * CAST(100 AS FLOAT) AS numeric), 2) as percent from window_cte as w order by percent desc limit 10;
