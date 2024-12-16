with unwrapped as (select item from SantaRecords s, jsonb_array_elements(cleaning_receipts) as item)
select u.item from unwrapped u where u.item ->> 'garment' = 'suit' and u.item ->> 'color' = 'green' order by u.item ->> 'drop_off' desc limit 5
