SELECT * FROM healthcare_data;

-- Data Analysis
-- q1. Which hospital has had the most number of visits? 
SELECT hospital, COUNT(visit_id) AS num_vistit
FROM healthcare_data
GROUP BY hospital
ORDER BY num_vistit DESC;

-- q2. Which patients have visited a hospital the most? 
SELECT patient_id, name, COUNT(patient_id) AS hospital_visit
FROM healthcare_data
GROUP BY patient_id, name
ORDER BY hospital_visit DESC;

-- q3. Which medical conditions does this hospital network treat? 
SELECT DISTINCT medical_condition
FROM healthcare_data;

-- q4. What is the highest single medical bill that a patient has? 
SELECT patient_id, name, MAX(billing_amount) AS max_bill_amount
FROM healthcare_data
GROUP BY patient_id, name
ORDER BY max_bill_amount DESC;

-- q5. What is the smallest medical bill that a patient has? Some values are less than zero, indicating an accounting error, or an overpayment, so we will only account for bills larger than $0.00.
WITH over_zero_bill_amount AS(
	SELECT patient_id, name, billing_amount
	FROM healthcare_data
	WHERE billing_amount > 0.00
)
SELECT patient_id, name, MIN(billing_amount) AS min_bill_amount
FROM over_zero_bill_amount
GROUP BY patient_id, name
ORDER BY min_bill_amount;

-- q6. What is the average medical bill that a patient comes out of the hospital with? 
SELECT CAST(AVG(Billing_Amount) AS DECIMAL(10, 2)) AS average_bill_amount
FROM healthcare_data;

-- q7. How many doctors work at more than one of our hospitals? 
SELECT COUNT(*) AS num_doctors_work_with_multiple_hospitals
FROM (
	SELECT doctor, COUNT(hospital) 
	FROM healthcare_data
	GROUP BY doctor
	HAVING COUNT(hospital) > 1
);

-- q8. Which doctors have had the most number of patient visits? 
SELECT doctor, COUNT(patient_id) AS num_visit
FROM healthcare_data
GROUP BY doctor
ORDER BY num_visit DESC;

-- q9. How many times are each medical condition treated?
SELECT medical_condition, COUNT(*) AS num_treated
FROM healthcare_data
GROUP BY medical_condition 

-- q10. Which years had the most to least amount of visits (from 2019-2024)?
SELECT EXTRACT(YEAR FROM date_of_admission) AS year, COUNT(visit_id) AS num_visit
FROM healthcare_data
GROUP BY year
ORDER BY num_visit DESC;

-- q11. What is the most prescribed medication for asthma?
SELECT medication, COUNT(*) AS medication_count
FROM healthcare_data
WHERE medical_condition = 'Asthma'
GROUP BY medication
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Q12. What is the distribution of patients by gender?
SELECT gender, COUNT(*) AS patient_count
FROM healthcare_data
GROUP BY gender
ORDER BY patient_count DESC;

-- Q13. What is the distribution of admission types (Urgent, Emergency, Elective)?
SELECT admission_type, COUNT(*) AS admission_type_count
FROM healthcare_data
GROUP BY admission_type
ORDER BY admission_type_count DESC;

-- q14. What is the distribution of emergency visits by medical condition?
SELECT medical_condition, COUNT(*) AS emergency_visit_count
FROM healthcare_data
WHERE admission_type = 'Emergency'
GROUP BY medical_condition
ORDER BY emergency_visit_count DESC;

-- q15. What are the most common blood types among patients?
SELECT blood_type, COUNT(*) AS blood_type_count
FROM healthcare_data
GROUP BY blood_type
ORDER BY blood_type_count DESC;

-- q16. Which insurance providers are most commonly used by patients?
SELECT insurance_provider, COUNT(*) AS insurance_provider_count
FROM healthcare_data
GROUP BY insurance_provider
ORDER BY insurance_provider_count DESC;

-- q17. What is the average billing amount by medical condition?
SELECT medical_condition, CAST(AVG(Billing_Amount) AS DECIMAL(10, 2)) AS average_bill_amount
FROM healthcare_data
GROUP BY medical_condition
ORDER BY average_bill_amount DESC;

-- q18. Which hospitals have the highest total billing amounts?
SELECT hospital, SUM(Billing_Amount) AS total_bill_amount
FROM healthcare_data
GROUP BY hospital
ORDER BY total_bill_amount DESC;

-- q19. What is the average length of stay (in days) for each medical condition?
SELECT medical_condition, 
       AVG(EXTRACT(DAY FROM AGE(discharge_date, date_of_admission))) AS avg_stay
FROM healthcare_data
GROUP BY medical_condition
ORDER BY avg_stay DESC;

-- q20. What is the trend in hospital visits over time (monthly)?
SELECT TO_CHAR(date_of_admission, 'YYYY-MM') AS admission_month, 
    COUNT(*) AS visit_count
FROM healthcare_data
GROUP BY admission_month
ORDER BY admission_month;

-- q21. Which patients have the highest total billing amounts across all visits?
SELECT patient_id, name, SUM(billing_amount) AS total_bill
FROM healthcare_data
GROUP BY patient_id, name
ORDER BY total_bill DESC;

-- q22. Which doctors treat the most diverse set of medical conditions?
SELECT doctor, COUNT(DISTINCT medical_condition) AS unique_condition_count
FROM healthcare_data
GROUP BY doctor
ORDER BY unique_condition_count DESC;

-- q23. Which patients have been admitted for multiple medical conditions?
SELECT patient_id, name, COUNT(DISTINCT medical_condition) AS multiple_conditions
FROM healthcare_data
GROUP BY patient_id, name
HAVING COUNT(DISTINCT medical_condition) > 1
ORDER BY multiple_conditions DESC;

--Let's investigate this and pull the types of conditions we are treating for most with our patients that are visiting for three different conditions. 
WITH PatientConditions AS (
    SELECT patient_id, medical_condition
    FROM healthcare_data
),
PatientsWithThreeConditions AS (
    SELECT patient_id
    FROM PatientConditions
    GROUP BY patient_id
    HAVING COUNT(DISTINCT medical_condition) = 3
)
SELECT 
    pc.medical_condition, 
    COUNT(DISTINCT pc.patient_id) AS patient_count
FROM 
    PatientConditions pc
INNER JOIN 
    PatientsWithThreeConditions p3 
    ON pc.patient_id = p3.patient_id
GROUP BY 
    pc.medical_condition
ORDER BY 
    patient_count DESC;

--What does this look like for patients who are only seen for Two different conditions? 
-- Step 1: Identify patients with exactly two unique medical conditions
WITH PatientConditions AS (
    SELECT patient_id, medical_condition
    FROM healthcare_data
),
UniqueConditionCounts AS (
    SELECT patient_id, COUNT(DISTINCT medical_condition) AS unique_conditions
    FROM PatientConditions
    GROUP BY patient_id
    HAVING COUNT(DISTINCT medical_condition) = 2
)

-- Step 2: Count how often each condition appears among these patients
SELECT 
    pc.medical_condition, 
    COUNT(*) AS condition_count
FROM PatientConditions pc
JOIN UniqueConditionCounts ucc
    ON pc.patient_id = ucc.patient_id
GROUP BY pc.medical_condition
ORDER BY condition_count DESC;

-- q24. Detect which patients went back to a hospital within 30 days of a previous admission. 
WITH PatientVisits AS (
    SELECT 
        patient_id, 
        name, 
        hospital, 
        date_of_admission,
        LEAD(date_of_admission) OVER (
            PARTITION BY patient_id ORDER BY date_of_admission
        ) AS next_admission
    FROM healthcare_data
)

SELECT 
    patient_id, 
    name, 
    hospital, 
    date_of_admission AS first_admission, 
    next_admission AS readmission_date,
    next_admission - date_of_admission AS days_between
FROM PatientVisits
WHERE next_admission IS NOT NULL
AND (next_admission - date_of_admission) <= 30
ORDER BY patient_id, date_of_admission;

--What is the correlation between age and billing amount?
WITH BillingByAge AS (
    SELECT 
        age,  
        ROUND(AVG(billing_amount), 2) AS avg_billing_amount
    FROM healthcare_data
    GROUP BY age
)
SELECT CORR(age, avg_billing_amount) AS age_billing_correlation
FROM BillingByAge;

--We have a very weak correlation coefficient (-0.325). This could indicate that our hospital prioritizes equal billing practices across ages, which could even be a strategic goal. 







