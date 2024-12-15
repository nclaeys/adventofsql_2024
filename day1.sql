WITH wishes AS (select c.name as name, w.wishes::json->>'first_choice' as first_choice, w.wishes::json->>'second_choice' as second_choice, w.wishes::json-> 'colors' ->> 0 as primary_color,json_array_length(to_json(w.wishes-> 'colors')) as color_count  from children as c, wish_lists w where c.child_id = w.child_id)

SELECT name, first_choice as primary_wish, second_choice as backup_wish, primary_color as favorite_color, color_count, case when tc.difficulty_to_make = 1 THEN 'Simple Gift' WHEN tc.difficulty_to_make = 2 THEN 'Moderate Gift' ELSE 'Complex Gift' END as gift_complexity, case WHEN tc.category = 'outdoor' THEN 'Outside Workshop' WHEN tc.category = 'educational' THEN 'Learning Workshop' ELSE 'General Workshop' END as workshop_assignment
FROM wishes as w, toy_catalogue as tc
WHERE w.first_choice = tc.toy_name ORDER by name asc limit 5;
