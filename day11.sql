WITH season_cte AS (select field_name, harvest_year, trees_harvested, season, CASE WHEN season = 'Spring' THEN 1 WHEN season = 'Summer' THEN 2 WHEN season = 'Fall' THEN 3 ELSE 4 END as season_id from TreeHarvests)

select field_name, harvest_year, season_id, season, ROUND(AVG(trees_harvested) OVER (PARTITION BY field_name ORDER BY season_id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS moving_average from season_cte order by moving_average desc limit 1;
