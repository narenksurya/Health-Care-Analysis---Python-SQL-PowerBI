# 🏥 Healthcare Operations & Patient Analytics: End-to-End Data Pipeline

## 📌 Overview
This project demonstrates a complete data analytics pipeline using **Python**, **SQL**, and **Power BI**.  
The goal was to transform raw, anomalous hospital data into a clean, queryable format to extract business intelligence regarding **patient length of stay**, **departmental performance**, and **insurance billing trends**.  

---

## 🔧 Phase 1: Data Cleaning & Preprocessing (Python)
The raw dataset (`hospital_data_dirty.csv`) contained inconsistencies, outliers, and missing values. Using **Pandas** and **NumPy**, the following cleaning steps were executed:

- 📝 **Column Standardization**: Formatted all column headers using `.str.title().str.strip()` to ensure consistent naming conventions (e.g., `Patient_Id`, `Admission_Date`).
- 💰 **Outlier Handling**: Identified and removed extreme anomalies in financial data, such as a billing amount entry of ₹950,000.0 and erroneous negative billing values (e.g., -₹1500).
- 🔍 **Missing Value Treatment & Feature Engineering**:  
  * Addressed missing `Discharge_Date` and `Vitals_Status` fields.  
  * Engineered a new boolean column, `Is_Active_Patient`, based on the presence of a discharge date.  
  * Calculated `Length_Of_Stay` by finding the difference between admission and discharge dates to aid in capacity planning analysis.
- 📤 **Export**: The transformed dataframe was exported as `Cleaned Healthcare Analysis.csv` for database ingestion.

---

## 🗄️ Phase 2: Exploratory Data Analysis (SQL)
The cleaned CSV was loaded into a SQL database to perform complex aggregations and identify patient cohorts. Key queries included:

- 📊 **Capacity Monitoring**: Used CTEs to filter and count the total number of currently active patients.
- 💵 **Financial Aggregation**: Grouped total billing amounts by `Insurance_Provider` to identify the most lucrative partnerships.
- 🔄 **Readmission Tracking**: Utilized `DATE()` functions and `HAVING COUNT() > 2` to identify "frequent flyers" (patients admitted more than twice in the last 6 months or 3 times in the last year).
- ⏱️ **Performance Benchmarking**: Leveraged CTEs and JOINs to calculate the average recovery time per department, and subsequently isolated patients whose `Length_Of_Stay` exceeded their respective department's average.
- 🏆 **Advanced Analytics**: Implemented Window Functions to rank departments by average billing.

---

## 📊 Phase 3: Data Visualization (Power BI)
Developed an interactive dashboard connecting to the cleaned data.

**Visuals Include:**
- 📈 KPI scorecards for **Total Revenue** and **Active Patients**
- 📊 Bar charts for **Departmental Average Length of Stay**
- 💳 Revenue breakdowns by **Insurance Provider**

---

## 🌟 Key Outcomes & Hidden Trends
- ✅ Successfully automated the identification of **high-risk patients** (those exceeding average recovery times).
- 🔗 Revealed strong correlations between specific departments (like **Oncology** and **Neurology**) and extended lengths of stay, heavily impacting total billing.
- 👥 Identified a core group of **frequently readmitted patients**, highlighting an opportunity for targeted outpatient care.

---

# 🏥 Business Insights & Strategic Analytics Report  

## 📌 Executive Summary  
A comprehensive analysis of recent **hospital admissions, billing records, and departmental workflows** reveals significant opportunities to:  
- ⚡ Optimize resource allocation  
- 💰 Accelerate revenue cycles  
- 📊 Transform anomalous operational data into structured metrics  

Key findings include:  
- 🚨 Bottlenecks in patient recovery times  
- 💳 Heavy dependencies on specific insurance payers  
- 🔄 High-frequency readmission cohort straining hospital capacity  

---

## 🔧 1. Data Integrity & Pipeline Enhancements  
The foundation of these insights stems from **rigorous data standardization**:  

- 💵 **Financial Anomaly Resolution**  
  - Removed erroneous negative billing (e.g., `-₹1,500`)  
  - Corrected severe outliers (e.g., single `₹950,000` record)  
  - ✅ Ensured accurate departmental revenue baselines  

- 🛏️ **Automated Capacity Tracking**  
  - Engineered **Length_Of_Stay** metric  
  - Introduced **Is_Active_Patient** flag  
  - 📈 Enabled real-time monitoring of bed availability & turnover  

---

## ⚙️ 2. Operational Efficiency & Capacity Management  
Analysis of patient movement highlights **departmental variances**:  

- 🧠 **Departmental Bottlenecks**  
  - Oncology & Neurology show naturally higher **ALOS**  
  - 🚩 Outliers severely exceeding departmental baselines  

- 🎯 **Targeted Intervention**  
  - Identified patients with recovery times far beyond norms  
  - Causes:  
    - 🕒 Delays in diagnostic lab results  
    - 🏥 Inefficiencies in discharge planning  
    - ⚕️ Complications requiring clinical review  

---

## 💵 3. Financial Health & Payer Dynamics  
Evaluation of billing amounts reveals **cash-flow dependencies**:  

- 📉 **Payer Concentration**  
  - Heavy reliance on **LIC & HDFC Ergo**  
  - ⚠️ Risk if payout timelines change or claims disputed  

- 📊 **Departmental Revenue Ranking**  
  - Segmented & ranked average billing per department  
  - 🔑 Insight: High-revenue departments need proportional investment  

---

## 🧑‍⚕️ 4. Patient Behavior & Quality of Care  
Historical tracking uncovered strain on emergency & inpatient resources:  

- 🔄 **Frequent Flyer Cohort**  
  - Subset of patients admitted **2+ times in 6 months**  
  - Others exceeding **3 visits in a year**  

- 🩺 **Root Cause Indicators**  
  - Inadequate outpatient follow-up  
  - Premature discharges  
  - Poor chronic condition management  

---

## 🚀 Strategic Recommendations  

- 🩺 **Readmission Intervention Protocol**  
  - Deploy care coordinators for high-frequency patients  
  - Transition to outpatient management / telehealth monitoring  

- ⏰ **Automated ALOS Alerts**  
  - Daily dashboard flags patients exceeding departmental ALOS by **15%**  
  - Triggers mandatory multi-disciplinary review  

- 💳 **Diversify Payer Strategies**  
  - Fast-track claims for LIC & HDFC Ergo  
  - Explore marketing to attract underrepresented, high-paying networks  

- 📋 **Standardize Discharge Criteria**  
  - Audit high-variance departments  
  - Ensure physicians use **data-backed milestones** for patient release  

---

