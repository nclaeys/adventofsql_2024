SELECT
    max(concat('2024-12-17 ', business_start_time)::timestamp AT TIME ZONE timezone AT TIME ZONE 'UTC') AS utc_start_time,
    min(concat('2024-12-17 ', business_end_time)::timestamp AT TIME ZONE timezone AT TIME ZONE 'UTC') AS utc_end_time
FROM Workshops;
