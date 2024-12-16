with avg_cte as (select AVG(price) as avg_price from gifts)
select c.name, g.price, g.name from gifts as g, avg_cte, children as c where price > avg_cte.avg_price AND c.child_id = g.child_id order by price asc limit 1;
