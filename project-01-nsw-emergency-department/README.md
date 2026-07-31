# 🏥 NSW Emergency Department Performance Analysis

## Executive Summary
This project analyzes public performance data from Emergency Departments across New South Wales (NSW) hospitals. Using Google BigQuery and SQL, this project investigates key operational metrics including median patient wait times, length of stay, and attendance volumes to identify trends and potential operational bottlenecks across local health districts.

---

## 🎯 Key Business Questions & Strategic Insights

1. **Which facilities experience the longest median ED stay times?**
   * *Finding:* Major metropolitan trauma centers (such as **Westmead Hospital**) consistently rank among the highest for median ED stay times, often exceeding 380 minutes (6+ hours) from arrival to discharge.

2. **How has performance trended over time for major facilities?**
   * *Finding:* Wait times and total duration of stay have steadily increased across recent quarters, reflecting growing patient volume pressure on tertiary referral facilities.

3. **Does overall patient volume directly correlate with elevated wait times?**
   * *Finding:* High attendance alone isn't the sole driver of prolonged wait times; peer group complexity (e.g., principal referral vs. district hospitals) plays a significant role in patient triage efficiency and bed availability.

---

## 🛠️ Tech Stack & Methodology

* **Database & Querying Engine:** Google BigQuery (SQL)
* **Dataset:** Bureau of Health Information (BHI) NSW ED Data
* **Data Engineering & Preparation:**
  * Cleaned raw string values into strict numerical types using `SAFE_CAST`.
  * Standardized facility names, health district codes, and reporting periods.
  * Pivot-aggregated metrics using conditional logic (`MAX(CASE WHEN...)`) to evaluate attendance alongside duration metrics on a single row basis.
  * Created a master production view (`vw_ed_performance_cleaned`) for seamless BI tool integration.

---

## 📂 Project Structure

```text
project-01-nsw-emergency-department/
│
├── sql/
│   ├── 01_longest_median_wait_times.sql   # Ranking top facilities by wait times
│   ├── 02_hospital_trend_over_time.sql    # Trend analysis over reporting quarters
│   ├── 03_volume_vs_wait_time.sql         # Comparing attendance vs. wait duration
│   └── 04_create_master_view.sql          # Production-ready data layer setup
│
└── README.md
