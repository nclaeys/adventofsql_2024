with emails as (select unnest(email_addresses) as email from contact_list)
select split_part(email, '@', 2) as domain, count(1) as count from emails group by domain order by count desc
 limit 1;
