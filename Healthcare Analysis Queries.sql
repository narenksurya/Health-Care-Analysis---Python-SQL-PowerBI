-- Selecting columns from the table
SELECT * FROM Cleaned_Healthcare_Analysis limit 10;

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