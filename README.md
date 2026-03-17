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

## 🎤 Presentation
A professional **Gamma presentation** was created to visually narrate the pipeline, insights, and outcomes, ensuring clarity and polish for stakeholders.
