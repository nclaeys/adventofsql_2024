with unnested as (select elf_name, id, unnest(string_to_array(skills, ',')) as unnested_skill from elves),
     has_elf_sql as (select id, 1 as has_sql from unnested where unnested_skill = 'SQL')
select COUNT(id) from has_elf_sql;
