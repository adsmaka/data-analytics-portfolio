SELECT 
    entity_longname AS hospital_name,
    reporting_period,
    measure_name,
    SAFE_CAST(measure_value AS FLOAT64) AS wait_time_minutes
FROM `nsw-health-analytics.nsw_hospital_data.ed_performance`
WHERE reporting_level = 'Hospital'
  AND LOWER(measure_name) LIKE '%median time%'
  AND reporting_period = 'Jan-Mar 2026' -- Filters specifically for the latest period
ORDER BY wait_time_minutes DESC
LIMIT 10;
