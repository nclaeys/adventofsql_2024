with url_and_params as (select request_id, url, split_part(url, '?', 1) as host, split_part(url, '?', 2) as query_param from web_requests where split_part(url, '?', 2) like '%utm_source=advent-of-sql%'),
key_value_pairs as (select request_id, url, host, query_param, string_to_array(query_param, '&') as parts from url_and_params),
keys as (select url, split_part(unnest(parts), '=', 1) as key_entry from key_value_pairs)
select url, count(key_entry) as count from keys group by url order by count desc, url asc
;
