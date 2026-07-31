SELECT 
    entity_longname AS hospital_name,
    reporting_period,
    MAX(CASE WHEN measure_name = 'Attendances' THEN SAFE_CAST(measure_value AS INT64) END) AS total_attendances,
    MAX(CASE WHEN LOWER(measure_name) LIKE '%median time%' THEN SAFE_CAST(measure_value AS FLOAT64) END) AS median_wait_time_minutes
FROM `nsw-health-analytics.nsw_hospital_data.ed_performance`
WHERE reporting_level = 'Hospital'
  AND reporting_period = 'Jan-Mar 2026'
GROUP BY hospital_name, reporting_period
HAVING total_attendances IS NOT NULL AND median_wait_time_minutes IS NOT NULL
ORDER BY total_attendances DESC;
