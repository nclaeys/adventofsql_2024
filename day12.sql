with sum as (select gift_id, count(1) as count from gift_requests group by gift_id),
    cte_rank as (select gift_id, percent_rank() over(ORDER BY count) as overall_rank from sum)
select g.gift_name, ROUND(CAST(overall_rank AS numeric),2) as percentile from cte_rank cr, gifts g where g.gift_id = cr.gift_id order by percentile desc, g.gift_name limit 20
