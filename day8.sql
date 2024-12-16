WITH recursive staff_hierarchy as (
    select staff_id, staff_name, manager_id, 1 as level, ARRAY[1] as path from staff where manager_id is null

    union all

    select s.staff_id, s.staff_name, s.manager_id, level +1, sh.path || s.staff_id from staff as s, staff_hierarchy sh where s.manager_id = sh.staff_id
)

select
    s.staff_id, s.staff_name as employee_name, array_length(sh.path, 1) as path_entries, sh.path as path, sh.level as level
FROM staff_hierarchy sh left join staff s on sh.staff_id = s.staff_id order by path_entries desc limit 10;
