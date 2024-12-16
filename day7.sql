WITH ranked_elves AS (
    SELECT
        elf_id,
        primary_skill,
        years_experience,
        ROW_NUMBER() OVER (PARTITION BY primary_skill ORDER BY years_experience DESC, elf_id ASC) AS max_rank,
        ROW_NUMBER() OVER (PARTITION BY primary_skill ORDER BY years_experience ASC, elf_id ASC) AS min_rank
    FROM
        workshop_elves
),
     max_elves AS (
         SELECT
             elf_id AS max_elf_id,
             primary_skill
         FROM
             ranked_elves
         WHERE
             max_rank = 1
     ),
     min_elves AS (
         SELECT
             elf_id AS min_elf_id,
             primary_skill
         FROM
             ranked_elves
         WHERE
             min_rank = 1
     )
SELECT
    max_elves.max_elf_id,
    min_elves.min_elf_id,
    max_elves.primary_skill
FROM
    max_elves
        JOIN
    min_elves
    ON
        max_elves.primary_skill = min_elves.primary_skill;
