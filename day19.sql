
with last_perf_score as (select employee_id, name, salary, year_end_performance_scores[array_length(year_end_performance_scores, 1)] as last_performance from employees),
avg_performance as (select avg(last_performance) as average from last_perf_score),
salary_plus_bonus as (select l.employee_id, case when l.last_performance > a.average then l.salary + 0.15*l.salary else l.salary end as full_salary from last_perf_score l, avg_performance a)

select sum(full_salary) from salary_plus_bonus
