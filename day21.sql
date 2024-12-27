with extracted_quarter as (select EXTRACT(YEAR from sale_date) as year, case
    when EXTRACT(MONTH from sale_date)  > 0 and EXTRACT(MONTH from sale_date) < 4 then 1
    when EXTRACT(MONTH from sale_date)  > 3 and EXTRACT(MONTH from sale_date) < 7 then 2
    when EXTRACT(MONTH from sale_date)  > 6 and EXTRACT(MONTH from sale_date) < 10 then 3
    when EXTRACT(MONTH from sale_date)  > 9 and EXTRACT(MONTH from sale_date) < 13 then 4
end as q, SUM(amount) as quarter_result from sales group by year, q order by year,q),
with_previous_amount as (select year, q, quarter_result, lag(quarter_result) over(order by year, q) as previous_quarter from extracted_quarter)
select year, q, quarter_result, previous_quarter, (quarter_result - previous_quarter)/previous_quarter as growth_rate from with_previous_amount order by growth_rate desc NULLS last limit 1;
