SELECT
    toy_id,
    coalesce(array_length(ARRAY(SELECT * FROM UNNEST(new_tags) WHERE not(UNNEST = ANY(previous_tags))), 1),0) AS added_tags,
    coalesce(array_length(ARRAY(SELECT * FROM UNNEST(new_tags) WHERE UNNEST = ANY(previous_tags)), 1),0) AS unchanged_tags,
    coalesce(array_length(ARRAY(SELECT * FROM UNNEST(previous_tags) WHERE not(UNNEST = ANY(new_tags))), 1), 0) AS removed_tags
FROM
    toy_production
ORDER BY added_tags desc
