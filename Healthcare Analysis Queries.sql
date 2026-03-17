-- Selecting columns from the table
SELECT * FROM Cleaned_Healthcare_Analysis limit 10;
|Patient_Id|Patient_Name|Admission_Date|Department|Diagnosis_Code|Doctor_Assigned|Insurance_Provider|Billing_Amount|Vitals_Status|Discharge_Date|Is_Active_Patient|Length_Of_Stay|
|----------|------------|--------------|----------|--------------|---------------|------------------|--------------|-------------|--------------|-----------------|--------------|
|1075|Sanjay Viswanathan|2025-08-05|Oncology|E11.9|Dr. Vikram|LIC|21854.31|Stable|2025-08-17|No|12|
|1002|Anitha Raj|2025-03-05|Neurology|E11.9|Dr. Rajesh|LIC|47782.14|Pending Assessment|2025-03-19|No|14|
|1021|Karthik Raja|2025-04-08|Neurology|C34.9|Dr. Shalini|LIC|37939.73|Stable|2025-04-16|No|8|
|1010|Karthik Raja|2025-05-26|Cardiology|J45.9|Dr. Shalini|HDFC Ergo|31939.63|Stable|2025-05-29|No|3|
|1016|Karthik Raja|2025-02-26|Pediatrics|G40.9|Dr. Vikram|LIC|12020.84|Recovering|2025-03-06|No|8|
|1065|Sanjay Viswanathan|2025-10-11|Cardiology|I21.9|Dr. Rajesh|Out-of-Pocket|7613.76|Stable|2025-10-12|No|1|
|1071|Rohan Gupta|2025-01-11|Cardiology|J45.9|Dr. Murugan|Star Health|43977.93|Recovering|2025-01-18|No|7|
|1014|Deepa Nair|2025-10-05|Cardiology|G40.9|Dr. Shalini|HDFC Ergo|32050.18|Stable|2025-10-10|No|5|
|1012|Vijay Sethupathi|2025-01-04|Neurology|J45.9|Dr. Aditi|Star Health|36863.27|Recovering|2025-01-10|No|6|
|1002|Priya Sharma|2025-01-29|Pediatrics|I21.9|Dr. Rajesh|Out-of-Pocket|950000.0|Recovering|2025-02-04|No|6|

-- Counting Active patients in the hospital
WITH active AS
(SELECT Patient_Id FROM Cleaned_Healthcare_Analysis WHERE Is_Active_Patient = 'Yes')
SELECT COUNT(Patient_Id) as Active_Patients FROM active;

-- Insurance Provider with Highest Billing Amount
SELECT Insurance_Provider, SUM(Billing_Amount) FROM Cleaned_Healthcare_Analysis
GROUP BY Insurance_Provider
ORDER BY SUM(Billing_Amount) DESC;

-- Patients admitted more than twice in the last 6 months
SELECT Patient_Id
FROM Cleaned_Healthcare_Analysis
WHERE DATE(Admission_Date) >= DATE('now', '-6 months')
GROUP BY Patient_Id
HAVING COUNT(Patient_Id) > 2;

-- Patients higher than the average recovery time per department
WITH CTE AS
(
    SELECT Department, ROUND(AVG(Length_Of_Stay), 2) AS Avg_Recovery_Time
    FROM Cleaned_Healthcare_Analysis
    GROUP BY Department
)
SELECT c.Patient_Id, c.Patient_Name, c.Department, d.Avg_Recovery_Time, c.Length_Of_Stay as Recovery_Time
FROM Cleaned_Healthcare_Analysis AS c
JOIN CTE AS d
ON c.Department = d.Department
WHERE c.Length_Of_Stay > d.Avg_Recovery_Time
ORDER BY c.Department, Recovery_Time DESC;

-- Patients visited more than 3 times in the last year
SELECT Patient_Id, Patient_Name
FROM Cleaned_Healthcare_Analysis cha
WHERE DATE(Admission_Date) >= DATE('now', '-12 months')
GROUP BY Patient_Id
HAVING COUNT(Patient_Id) > 3;

-- Ranking departments by average billing using a Window Function
WITH DeptBilling AS (
    SELECT 
        Department, 
        ROUND(AVG(Billing_Amount), 2) AS Average_Billing
    FROM Cleaned_Healthcare_Analysis
    GROUP BY Department
)
SELECT 
    Department, 
    Average_Billing,
    RANK() OVER (ORDER BY Average_Billing DESC) AS Billing_Rank
FROM DeptBilling;
