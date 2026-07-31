-- Query 04: Create Master Cleaned View
-- Purpose: Standardize column names and types for downstream BI tools (Tableau / Looker Studio).

CREATE OR REPLACE VIEW `nsw-health-analytics.nsw_hospital_data.vw_ed_performance_cleaned` AS
SELECT 
    entity_id AS facility_code,
    entity_longname AS hospital_name,
    lhd_shortname AS local_health_district,
    peer_group_shortname AS peer_group,
    reporting_period,
    reporting_level,
    measure_name,
    metric AS unit_of_measure,
    SAFE_CAST(measure_value AS FLOAT64) AS measure_value_num
FROM `nsw-health-analytics.nsw_hospital_data.ed_performance`
WHERE measure_value IS NOT NULL;
