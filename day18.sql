with recursive staff_hier as (
    select staff_id, staff_name, 1 as level, ARRAY[1] as path, manager_id from staff where manager_id is null

    union all

    select s.staff_id, s.staff_name,level + 1, sh.path || s.staff_id, s.manager_id from staff as s, staff_hier sh where s.manager_id = sh.staff_id
),
    peers_per_level as (select level, count(1) as peers from staff_hier group by level)

select s.staff_id, s.staff_name, s.level, p.peers, s.manager_id from staff_hier s, peers_per_level p where p.level = s.level order by p.peers desc, s.level asc, s.staff_id asc limit 20;
