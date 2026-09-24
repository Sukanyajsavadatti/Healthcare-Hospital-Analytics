-- ============================================================
-- Healthcare Patient & Hospital Operations Analytics
-- ============================================================
-- Purpose:
-- Analyze patient demographics, hospital admissions,
-- appointments, treatments, and departmental operations.
--
-- Tools: SQL, Power BI, Excel, Python
-- ============================================================




-- ============================================================
-- SECTION 1: PATIENT ANALYSIS
-- ============================================================

-- 1. Total number of patients
SELECT COUNT(*) AS total_patients
FROM patients;


-- 2. Patient count by gender
SELECT
    gender,
    COUNT(*) AS patient_count
FROM patients
GROUP BY gender
ORDER BY patient_count DESC;


-- 3. Patient count by age group
SELECT
    CASE
        WHEN age < 18 THEN 'Under 18'
        WHEN age BETWEEN 18 AND 30 THEN '18-30'
        WHEN age BETWEEN 31 AND 45 THEN '31-45'
        WHEN age BETWEEN 46 AND 60 THEN '46-60'
        ELSE 'Above 60'
    END AS age_group,
    COUNT(*) AS patient_count
FROM patients
GROUP BY
    CASE
        WHEN age < 18 THEN 'Under 18'
        WHEN age BETWEEN 18 AND 30 THEN '18-30'
        WHEN age BETWEEN 31 AND 45 THEN '31-45'
        WHEN age BETWEEN 46 AND 60 THEN '46-60'
        ELSE 'Above 60'
    END
ORDER BY patient_count DESC;


-- 4. Average patient age
SELECT
    ROUND(AVG(age), 2) AS average_patient_age
FROM patients;


-- 5. Patient count by city
SELECT
    city,
    COUNT(*) AS patient_count
FROM patients
GROUP BY city
ORDER BY patient_count DESC;


-- 6. Patient count by insurance type
SELECT
    insurance_type,
    COUNT(*) AS patient_count
FROM patients
GROUP BY insurance_type
ORDER BY patient_count DESC;

-- 7. Check for missing patient information
SELECT
    COUNT(*) AS missing_patient_records
FROM patients
WHERE patient_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR city IS NULL
   OR insurance_type IS NULL;


-- ============================================================
-- SECTION 2: ADMISSIONS ANALYSIS
-- ============================================================


-- 1. Total number of admissions
SELECT
    COUNT(*) AS total_admissions
FROM admissions;


-- 2. Admissions by diagnosis
SELECT
    Diagnosis,
    COUNT(*) AS admission_count
FROM admissions
GROUP BY Diagnosis
ORDER BY admission_count DESC;


-- 3. Admissions by admission type
SELECT
    Admission_Type,
    COUNT(*) AS admission_count
FROM admissions
GROUP BY Admission_Type
ORDER BY admission_count DESC;


-- 4. Admissions by department
SELECT
    Department_ID,
    COUNT(*) AS admission_count
FROM admissions
GROUP BY Department_ID
ORDER BY admission_count DESC;


-- 5. Admissions by outcome
SELECT
    Outcome,
    COUNT(*) AS outcome_count
FROM admissions
GROUP BY Outcome
ORDER BY outcome_count DESC;


-- 6. Readmission analysis
SELECT
    Readmission,
    COUNT(*) AS admission_count
FROM admissions
GROUP BY Readmission
ORDER BY admission_count DESC;


-- 7. Average length of hospital stay
SELECT
    ROUND(
        AVG(DATEDIFF(Discharge_Date, Admission_Date)),
        2
    ) AS average_length_of_stay_days
FROM admissions;


-- 8. Maximum length of hospital stay
SELECT
    MAX(DATEDIFF(Discharge_Date, Admission_Date))
        AS maximum_length_of_stay_days
FROM admissions;


-- 9. Admissions by year
SELECT
    YEAR(Admission_Date) AS admission_year,
    COUNT(*) AS admission_count
FROM admissions
GROUP BY YEAR(Admission_Date)
ORDER BY admission_year;


-- 10. Check for missing admission information
SELECT
    COUNT(*) AS missing_admission_records
FROM admissions
WHERE Admission_ID IS NULL
   OR Patient_ID IS NULL
   OR Department_ID IS NULL
   OR Admission_Date IS NULL
   OR Discharge_Date IS NULL
   OR Admission_Type IS NULL
   OR Diagnosis IS NULL
   OR Outcome IS NULL
   OR Readmission IS NULL;



-- ============================================================
-- SECTION 3: APPOINTMENT ANALYSIS
-- ============================================================

-- 1. Total number of appointments
SELECT
    COUNT(*) AS total_appointments
FROM appointments;


-- 2. Appointment count by status
SELECT
    Appointment_Status,
    COUNT(*) AS appointment_count
FROM appointments
GROUP BY Appointment_Status
ORDER BY appointment_count DESC;


-- 3. Appointments by department
SELECT
    Department_ID,
    COUNT(*) AS appointment_count
FROM appointments
GROUP BY Department_ID
ORDER BY appointment_count DESC;


-- 4. Average waiting time
SELECT
    ROUND(AVG(Waiting_Time_Min), 2) AS average_waiting_time_minutes
FROM appointments;


-- 5. Maximum waiting time
SELECT
    MAX(Waiting_Time_Min) AS maximum_waiting_time_minutes
FROM appointments;


-- 6. Minimum waiting time
SELECT
    MIN(Waiting_Time_Min) AS minimum_waiting_time_minutes
FROM appointments;


-- 7. Average waiting time by appointment status
SELECT
    Appointment_Status,
    ROUND(AVG(Waiting_Time_Min), 2) AS average_waiting_time_minutes
FROM appointments
GROUP BY Appointment_Status
ORDER BY average_waiting_time_minutes DESC;


-- 8. Monthly appointment trend
SELECT
    YEAR(Appointment_Date) AS appointment_year,
    MONTH(Appointment_Date) AS appointment_month,
    COUNT(*) AS appointment_count
FROM appointments
GROUP BY
    YEAR(Appointment_Date),
    MONTH(Appointment_Date)
ORDER BY
    appointment_year,
    appointment_month;


-- 9. Appointments with long waiting times
SELECT
    COUNT(*) AS long_waiting_appointments
FROM appointments
WHERE Waiting_Time_Min > 30;


-- 10. Check for missing appointment information
SELECT
    COUNT(*) AS missing_appointment_records
FROM appointments
WHERE Appointment_ID IS NULL
   OR Patient_ID IS NULL
   OR Department_ID IS NULL
   OR Appointment_Date IS NULL
   OR Appointment_Status IS NULL
   OR Waiting_Time_Min IS NULL;


-- ============================================================
-- SECTION 4: TREATMENT ANALYSIS
-- ============================================================

-- 1. Total number of treatments
SELECT
    COUNT(*) AS total_treatments
FROM treatments;


-- 2. Total treatment cost
SELECT
    ROUND(SUM(Treatment_Cost), 2) AS total_treatment_cost
FROM treatments;


-- 3. Average treatment cost
SELECT
    ROUND(AVG(Treatment_Cost), 2) AS average_treatment_cost
FROM treatments;


-- 4. Minimum and maximum treatment cost
SELECT
    MIN(Treatment_Cost) AS minimum_treatment_cost,
    MAX(Treatment_Cost) AS maximum_treatment_cost
FROM treatments;


-- 5. Treatment count by treatment type
SELECT
    Treatment_Type,
    COUNT(*) AS treatment_count
FROM treatments
GROUP BY Treatment_Type
ORDER BY treatment_count DESC;


-- 6. Treatment cost by treatment type
SELECT
    Treatment_Type,
    COUNT(*) AS treatment_count,
    ROUND(SUM(Treatment_Cost), 2) AS total_treatment_cost,
    ROUND(AVG(Treatment_Cost), 2) AS average_treatment_cost
FROM treatments
GROUP BY Treatment_Type
ORDER BY total_treatment_cost DESC;


-- 7. Treatment count by doctor
SELECT
    Doctor_ID,
    COUNT(*) AS treatment_count
FROM treatments
GROUP BY Doctor_ID
ORDER BY treatment_count DESC;


-- 8. Treatment cost by doctor
SELECT
    Doctor_ID,
    COUNT(*) AS treatment_count,
    ROUND(SUM(Treatment_Cost), 2) AS total_treatment_cost,
    ROUND(AVG(Treatment_Cost), 2) AS average_treatment_cost
FROM treatments
GROUP BY Doctor_ID
ORDER BY total_treatment_cost DESC;


-- 9. High-cost treatments
SELECT
    Treatment_ID,
    Admission_ID,
    Treatment_Type,
    Treatment_Cost,
    Doctor_ID
FROM treatments
WHERE Treatment_Cost > 20000
ORDER BY Treatment_Cost DESC;


-- 10. Check for missing treatment information
SELECT
    COUNT(*) AS missing_treatment_records
FROM treatments
WHERE Treatment_ID IS NULL
   OR Admission_ID IS NULL
   OR Treatment_Type IS NULL
   OR Treatment_Cost IS NULL
   OR Doctor_ID IS NULL;


-- ============================================================
-- SECTION 5: DEPARTMENT ANALYSIS
-- ============================================================


-- 1. Total number of departments
SELECT
    COUNT(*) AS total_departments
FROM departments;


-- 2. Department list with location and bed capacity
SELECT
    Department_ID,
    Department_Name,
    Location,
    Bed_Count
FROM departments
ORDER BY Department_Name;


-- 3. Total bed capacity
SELECT
    SUM(Bed_Count) AS total_beds
FROM departments;


-- 4. Departments by bed capacity
SELECT
    Department_Name,
    Bed_Count
FROM departments
ORDER BY Bed_Count DESC;


-- 5. Average bed capacity per department
SELECT
    ROUND(AVG(Bed_Count), 2) AS average_bed_capacity
FROM departments;


-- 6. Check for missing department information
SELECT
    COUNT(*) AS missing_department_records
FROM departments
WHERE Department_ID IS NULL
   OR Department_Name IS NULL
   OR Location IS NULL
   OR Bed_Count IS NULL;


-- ============================================================
-- SECTION 6: CROSS-TABLE ANALYSIS / JOINS
-- ============================================================


-- 1. Admissions with patient details
SELECT
    a.Admission_ID,
    a.Patient_ID,
    p.Gender,
    p.Age,
    p.City,
    a.Diagnosis,
    a.Admission_Type,
    a.Outcome
FROM admissions a
JOIN patients p
    ON a.Patient_ID = p.Patient_ID;


-- 2. Admissions by department name
SELECT
    d.Department_Name,
    COUNT(a.Admission_ID) AS admission_count
FROM admissions a
JOIN departments d
    ON a.Department_ID = d.Department_ID
GROUP BY d.Department_Name
ORDER BY admission_count DESC;


-- 3. Average hospital stay by department
SELECT
    d.Department_Name,
    ROUND(
        AVG(DATEDIFF(a.Discharge_Date, a.Admission_Date)),
        2
    ) AS average_length_of_stay_days
FROM admissions a
JOIN departments d
    ON a.Department_ID = d.Department_ID
GROUP BY d.Department_Name
ORDER BY average_length_of_stay_days DESC;


-- 4. Treatment cost by department
SELECT
    d.Department_Name,
    COUNT(t.Treatment_ID) AS treatment_count,
    ROUND(SUM(t.Treatment_Cost), 2) AS total_treatment_cost,
    ROUND(AVG(t.Treatment_Cost), 2) AS average_treatment_cost
FROM treatments t
JOIN admissions a
    ON t.Admission_ID = a.Admission_ID
JOIN departments d
    ON a.Department_ID = d.Department_ID
GROUP BY d.Department_Name
ORDER BY total_treatment_cost DESC;


-- 5. Patient admissions by gender
SELECT
    p.Gender,
    COUNT(a.Admission_ID) AS admission_count
FROM patients p
JOIN admissions a
    ON p.Patient_ID = a.Patient_ID
GROUP BY p.Gender
ORDER BY admission_count DESC;


-- 6. Appointment count by department name
SELECT
    d.Department_Name,
    COUNT(ap.Appointment_ID) AS appointment_count
FROM appointments ap
JOIN departments d
    ON ap.Department_ID = d.Department_ID
GROUP BY d.Department_Name
ORDER BY appointment_count DESC;


-- 7. Patient treatment history
SELECT
    p.Patient_ID,
    p.Gender,
    p.Age,
    a.Diagnosis,
    t.Treatment_Type,
    t.Treatment_Cost,
    t.Doctor_ID
FROM patients p
JOIN admissions a
    ON p.Patient_ID = a.Patient_ID
JOIN treatments t
    ON a.Admission_ID = t.Admission_ID
ORDER BY p.Patient_ID;


-- ============================================================
-- SECTION 7: ADVANCED SQL ANALYSIS
-- ============================================================


-- 1. Patients with multiple admissions
SELECT
    Patient_ID,
    COUNT(Admission_ID) AS admission_count
FROM admissions
GROUP BY Patient_ID
HAVING COUNT(Admission_ID) > 1
ORDER BY admission_count DESC;


-- 2. Departments with above-average admission counts
SELECT
    d.Department_Name,
    COUNT(a.Admission_ID) AS admission_count
FROM admissions a
JOIN departments d
    ON a.Department_ID = d.Department_ID
GROUP BY d.Department_Name
HAVING COUNT(a.Admission_ID) >
(
    SELECT AVG(department_admissions)
    FROM
    (
        SELECT
            Department_ID,
            COUNT(*) AS department_admissions
        FROM admissions
        GROUP BY Department_ID
    ) AS department_summary
)
ORDER BY admission_count DESC;


-- 3. Top 5 most expensive treatments
SELECT
    Treatment_ID,
    Admission_ID,
    Treatment_Type,
    Treatment_Cost,
    Doctor_ID
FROM treatments
ORDER BY Treatment_Cost DESC
LIMIT 5;


-- 4. Patients with treatment costs above the average
SELECT
    t.Treatment_ID,
    t.Admission_ID,
    t.Treatment_Type,
    t.Treatment_Cost,
    t.Doctor_ID
FROM treatments t
WHERE t.Treatment_Cost >
(
    SELECT AVG(Treatment_Cost)
    FROM treatments
)
ORDER BY t.Treatment_Cost DESC;


-- 5. Rank departments by total treatment cost
SELECT
    d.Department_Name,
    ROUND(SUM(t.Treatment_Cost), 2) AS total_treatment_cost,
    RANK() OVER (
        ORDER BY SUM(t.Treatment_Cost) DESC
    ) AS cost_rank
FROM treatments t
JOIN admissions a
    ON t.Admission_ID = a.Admission_ID
JOIN departments d
    ON a.Department_ID = d.Department_ID
GROUP BY d.Department_Name
ORDER BY cost_rank;
