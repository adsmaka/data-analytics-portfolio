SELECT 
    entity_longname AS hospital_name,
    reporting_period,
    measure_name,
    SAFE_CAST(measure_value AS FLOAT64) AS wait_time_minutes
FROM `nsw-health-analytics.nsw_hospital_data.ed_performance`
WHERE reporting_level = 'Hospital'
  AND entity_longname = 'Westmead Hospital'
  AND LOWER(measure_name) LIKE '%median time%'
ORDER BY reporting_period ASC;
