# SQL Healthcare Analysis Project
## Table of Contents
1. [Overview](#overview)
2. [Key Skills Demonstrated](#key-skills-demonstrated)
3. [Project Details](#project-details)
   - [Dataset](#dataset)
   - [Tools Used](#tools-used)
4. [Analysis Steps](#analysis-steps)
   - [Data Cleaning](#1-data-cleaning)
   - [Data Analysis](#2-data-analysis)
5. [Key Findings and Insights](#key-findings-and-insights)
6. [SQL Code Examples](#sql-code-examples)
   - [Data Cleaning](#data-cleaning)
   - [Data Analysis](#data-analysis)
7. [Future Enhancements](#future-enhancements)
8. [Connect with Me](#connect-with-me)



## Overview
This project showcases my expertise in SQL for data cleaning, analysis, and visualization using a healthcare dataset. The goal was to extract actionable insights to improve patient outcomes, optimize hospital operations, and support decision-making. This project demonstrates my ability to handle real-world data challenges, derive meaningful insights, and present them in a clear and professional manner.



## Key Skills Demonstrated
- **SQL Proficiency**: Complex queries, joins, subqueries, aggregations, and window functions
- **Data Cleaning** : Handling duplicates, missing values, anomalies, and standardizing data.
- **Data Analysis** : Identifying trends, patterns, and key metrics in healthcare data.
- **Problem-Solving** : Addressing real-world healthcare challenges using data-driven approaches.
- **Documentation** : Clearly explaining the process, findings, and recommendations.



## Project Details

### Dataset
The dataset contains healthcare-related information, including
- Patient demographics (name, age, gender, blood type).
- Medical conditions and treatments.
- Hospital and doctor details.
- Insurance providers and billing amounts.
- Admission and discharge dates.
- Test results and medications.

### Tools Used
- **SQL**: For querying, cleaning, and analyzing the dataset
- **Database Management System** : PostgreSQL



## Analysis Steps

### 1. Data Cleaning
- **Standardized Names**: Removed special characters and formatted names consistently.
- **Standardized Gender Values** : Converted gender values into consistent categories (Male, Female, Other).
- **Removed Duplicates** : Identified and removed exact duplicate records.
- **Handled Anomalies** : Detected and resolved inconsistencies (e.g., patients with multiple ages).
- **Created Patient IDs** : Assigned unique patient IDs to track individuals across visits.
- **Rounded Billing Amounts** : Standardized billing amounts to two decimal places.
- **Assigned Visit IDs** : Created unique visit IDs for each patient admission.

### 2. Data Analysis
Performed a comprehensive analysis to answer key business questions, including:
- **Hospital Utilization**: Identified hospitals with the highest visits and revenue.
- **Patient Engagement**: Tracked frequent visitors and readmission rates.
- **Medical Conditions**: Analyzed the most common conditions and prescribed medications.
- **Billing Analysis**: Examined billing variability and calculated average billing amounts.
- **Insurance Patterns**: Identified top insurance providers and payment trends.
- **Doctor Performance**: Highlighted doctors with the most visits and resource-sharing practices.
- **Patient Demographics**: Analyzed gender distribution and blood type prevalence.
- **Emergency Admissions**: Investigated conditions leading to emergency visits.
- **Trends Over Time**: Analyzed visit trends over the years, focusing on peak periods.
- **Age vs. Billing**: Investigated the correlation between patient age and billing amounts.


## Key Findings and Insights
### **1. Hospital Utilization**
- **"LLC Smith"** had the highest number of patient visits (**40 visits**), indicating high utilization and patient preference.
  - **Insight**: This hospital may require additional resources, such as increased staffing, enhanced facilities, or upgraded medical technology, to manage high patient volumes while maintaining quality care.

- **"Johnson PLC"** generated the highest total billing amount (**$1,037,706.22**), highlighting significant financial throughput.
  - **Insight**: This hospital is a key revenue driver and could serve as a model for best practices in financial management and operational efficiency.


### **2. Patient Engagement and Frequency**
- Patients such as **Danielle Garcia**, **Maria Johnson**, and **Michael Jones** had the most frequent visits (**3 visits each**).
  - **Insight**: Frequent visitors may benefit from personalized follow-up programs, including regular check-ins, comprehensive discharge planning, and patient education on chronic disease management, to reduce readmissions and improve long-term health outcomes.


### **3. Medical Conditions Treated**
- The most commonly treated conditions include **Arthritis**, **Diabetes**, **Hypertension**, **Cancer**, and **Obesity**, each with over **8,000 cases**.
  - **Insight**: Hospitals should allocate targeted resources, such as specialized healthcare professionals, advanced diagnostic equipment, and tailored patient education programs, to effectively manage these high-prevalence conditions.


### **4. Billing Analysis**
- The **highest single medical bill** recorded was **$52,764.28** (Patient: **Todd Carrillo**).
  - **Insight**: High-cost patients may benefit from cost-effective strategies, such as bundled treatment packages, generic medication alternatives, or structured financial assistance programs, to alleviate financial burdens and ensure accessible care.

- The **lowest positive medical bill** was only **$9.24** (Patient: **Wendy Dillon**), indicating significant variability in billing amounts.
  - **Insight**: Hospitals should investigate the reasons for such variability, such as administrative errors, discrepancies in treatment complexity, or inconsistent billing procedures, to ensure fair and consistent billing practices.

- The **average medical bill** across all treatments is approximately **$25,561.41**.
  - **Insight**: This benchmark can help hospitals assess their financial performance and identify areas for cost optimization.


### **5. Insurance and Payment Patterns**
- The top insurance providers include **Cigna**, **Medicare**, **Blue Cross**, **UnitedHealthcare**, and **Aetna**, each covering thousands of patients.
  - **Insight**: Hospitals should maintain strong relationships with these providers to ensure smooth billing and reimbursement processes.


### **6. Doctor Engagement**
- **5,856 doctors** work across multiple hospitals, suggesting strong resource-sharing practices.
  - **Insight**: This collaboration can lead to better patient outcomes and operational efficiency.

- **Dr. Michael Smith** handled the most patient visits (**24 visits**), indicating significant patient trust or specialized expertise.
  - **Insight**: This doctor may need support to manage their workload effectively or could serve as a mentor for other physicians.


### **7. Treatment Patterns and Medication**
- **Paracetamol** was the most prescribed medication for **Asthma**, with **1,687 prescriptions**.
  - **Insight**: This medication should be well-stocked to meet patient demand and ensure effective treatment.


### **8. Patient Demographics**
- **Gender distribution** is balanced (**Female: 24,755**, **Male: 24,711**).
  - **Insight**: Healthcare services should be tailored to meet the needs of all genders equally.

- The most common blood type among patients is **AB+** (**6,226 occurrences**).
  - **Insight**: Hospitals should ensure adequate blood supply for this blood type to meet patient needs.


### **9. Emergency Admission Analysis**
- Conditions such as **Obesity** and **Arthritis** led emergency visits, with approximately **2,785** and **2,752** cases, respectively.
  - **Insight**: Hospitals should prepare resources and staff to handle these high-priority conditions effectively.


### **10. Readmission Rate Analysis**
- Several patients were readmitted within 30 days, notably **Amy Brown** (1 day) and **Matthew Gonzalez** (2 days).
  - **Insight**: High readmission rates may indicate issues with treatment effectiveness or post-discharge care. Hospitals should enhance discharge processes through structured patient education, detailed discharge instructions, scheduled post-discharge follow-ups, and clear communication channels to reduce potential readmissions.


### **11. Trends Over Time**
- **Year 2020** had the most hospital visits (**10,043**), followed closely by **2023** (**9,839 visits**).
  - **Insight**: Hospitals should analyze the factors driving these trends, particularly considering the significant impact of the COVID-19 pandemic in 2020, and develop contingency plans to effectively manage future surges in patient volume due to similar health crises.


### **12. Correlation Between Age and Billing Amount**
- Analysis indicates a **weak correlation** between age and billing amount.
  - **Insight**: This suggests equitable billing practices across age groups, which could be a strategic goal for the hospital.



## SQL Code Examples

### Data Cleaning
```sql
-- 1. Standardizing Names
UPDATE healthcare_data
SET Name = INITCAP(TRIM(REGEXP_REPLACE(Name, '[^a-zA-Z\s]', '', 'g')));

-- 2. Standardizing Gender Values
UPDATE healthcare_data
SET Gender = CASE 
    WHEN LOWER(Gender) IN ('m', 'male') THEN 'Male'
    WHEN LOWER(Gender) IN ('f', 'female') THEN 'Female'
    ELSE 'Other'
END;

-- 3. Removing Duplicate Records 
-- Looking for duplicate entries
SELECT name, age, gender, blood_type, medical_condition, date_of_admission, doctor, hospital, insurance_provider, billing_amount, room_number, admission_type, discharge_date, medication, test_results
FROM healthcare_data
GROUP BY name, age, gender, blood_type, medical_condition, date_of_admission, doctor, hospital, insurance_provider, billing_amount, room_number, admission_type, discharge_date, medication, test_results
HAVING COUNT(*) > 1;

SELECT * 
FROM healthcare_data
WHERE name = 'Abigail Young';

SELECT * INTO healthcare_data_backup_2
FROM healthcare_data;

-- Removes exact duplicate records while keeping one copy
WITH RankedRecords AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY name, age, gender, blood_type, medical_condition, 
                            date_of_admission, doctor, hospital, insurance_provider, 
                            billing_amount, room_number, admission_type, 
                            discharge_date, medication, test_results
               ORDER BY name -- You can use any column here
           ) AS rn
    FROM healthcare_data
)
DELETE FROM healthcare_data
WHERE (name, age, gender, blood_type, medical_condition, date_of_admission, 
       doctor, hospital, insurance_provider, billing_amount, room_number, 
       admission_type, discharge_date, medication, test_results) IN (
    SELECT name, age, gender, blood_type, medical_condition, date_of_admission, 
           doctor, hospital, insurance_provider, billing_amount, room_number, 
           admission_type, discharge_date, medication, test_results
    FROM RankedRecords
    WHERE rn > 1
);

-- 4. Detecting Anomalies in Data
-- Some patient records are duplicated where every field matches except for Age.
SELECT 
    name, gender, blood_type, medical_condition, date_of_admission, 
    doctor, hospital, insurance_provider, billing_amount, room_number, 
    admission_type, discharge_date, medication, test_results, 
    COUNT(DISTINCT age) AS age_variations
FROM healthcare_data
GROUP BY 
    name, gender, blood_type, medical_condition, date_of_admission, 
    doctor, hospital, insurance_provider, billing_amount, room_number, 
    admission_type, discharge_date, medication, test_results
HAVING COUNT(DISTINCT age) > 1;
	
SELECT * INTO healthcare_data_backup_3
FROM healthcare_data;

DELETE FROM healthcare_data h1
WHERE EXISTS (
    SELECT 1 
    FROM healthcare_data h2
    WHERE h1.name = h2.name
    AND h1.gender = h2.gender
    AND h1.blood_type = h2.blood_type
    AND h1.medical_condition = h2.medical_condition
    AND h1.date_of_admission = h2.date_of_admission
    AND h1.doctor = h2.doctor
    AND h1.hospital = h2.hospital
    AND h1.insurance_provider = h2.insurance_provider
    AND h1.billing_amount = h2.billing_amount
    AND h1.room_number = h2.room_number
    AND h1.admission_type = h2.admission_type
    AND h1.discharge_date = h2.discharge_date
    AND h1.medication = h2.medication
    AND h1.test_results = h2.test_results
    AND h1.age > h2.age
);


-- 5. Create Patient ID
-- Determine how many years this dataset covers.
SELECT 
    (EXTRACT(YEAR FROM MAX(date_of_admission)) - EXTRACT(YEAR FROM MIN(date_of_admission))) AS total_years_covered
FROM healthcare_data;
--Since the database covers 5 years, we will use 6 just to be safe. 

SELECT *
INTO healthcare_data_backup_4
FROM healthcare_data;

-- Add the patient_id column (if not already added).
ALTER TABLE healthcare_data
ADD patient_id INT;

WITH PatientData AS (
    SELECT 
        name,
        blood_type,
        age,
        ROW_NUMBER() OVER (ORDER BY name, blood_type, age) AS row_num
    FROM healthcare_data
),
GroupedPatients AS (
    SELECT 
        p1.name,
        p1.blood_type,
        p1.age,
        MIN(p2.row_num) AS group_id
    FROM PatientData p1
    LEFT JOIN PatientData p2
        ON p1.name = p2.name
        AND p1.blood_type = p2.blood_type
        AND p2.age BETWEEN p1.age - 6 AND p1.age + 6 -- ±6 years range
    GROUP BY p1.name, p1.blood_type, p1.age
),
FinalPatients AS (
    SELECT 
        name,
        blood_type,
        age,
        DENSE_RANK() OVER (ORDER BY group_id) AS patient_id
    FROM GroupedPatients
)
UPDATE healthcare_data
SET patient_id= FinalPatients.patient_id
FROM FinalPatients
WHERE healthcare_data.name = FinalPatients.name 
AND healthcare_data.blood_type = FinalPatients.blood_type 
AND healthcare_data.age = FinalPatients.age;

SELECT * 
FROM healthcare_data
ORDER BY patient_id

-- Round the billing amounts to cut off extra decimal values
SELECT *
INTO healthcare_data_backup_5
FROM healthcare_data;

UPDATE healthcare_data
SET billing_amount = ROUND(billing_amount, 2);

ALTER TABLE healthcare_data
ALTER COLUMN billing_amount TYPE DECIMAL(10,2) USING billing_amount::DECIMAL(10,2);

select billing_amount from healthcare_data;

-- 6. Assign visit IDs for each visit
SELECT * INTO healthcare_data_backup_6
FROM healthcare_data;

-- Step 1: Add the visit_id column.
ALTER TABLE healthcare_data
ADD visit_id INT; 

-- Step 2: Assign the visit_id numbers.
WITH VisitData AS (
    SELECT
	name, age, gender, blood_type, medical_condition, date_of_admission, 
    doctor, hospital, insurance_provider, billing_amount, room_number, 
    admission_type, discharge_date, medication, test_results, patient_id,
        ROW_NUMBER() OVER (ORDER BY date_of_admission) AS visit_id
    FROM healthcare_data
)
UPDATE healthcare_data
SET visit_id = VisitData.visit_id
FROM VisitData
WHERE healthcare_data.name = VisitData.name
AND healthcare_data.blood_type = VisitData.blood_type
AND healthcare_data.age = VisitData.age
AND healthcare_data.date_of_admission = VisitData.date_of_admission;
```

### Data Analysis
```sql
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
```

## Future Enhancements
- Incorporate machine learning models to predict patient readmissions.
- Expand the dataset to include more variables for deeper analysis.
- Create an interactive dashboard for real-time data exploration.

## Connect with Me

I am a recent graduate with a **Master of Science in Analytics** from the **University of Southern California (USC)**, where I honed my skills in data analysis, machine learning, and data-driven decision-making. Passionate about uncovering insights from data, I thrive on solving complex problems and transforming raw data into actionable strategies.

I am actively seeking opportunities as a **Data Analyst** or **Business Analyst**, where I can leverage my technical expertise, analytical mindset, and passion for data to drive impactful decisions. If you're looking for someone who can turn data into meaningful stories and solutions, let's connect!

- **LinkedIn**: [Runrun Mao](https://www.linkedin.com/in/runrun-mao/)  
- **Email**: [runrunmao0202@gmail.com](mailto:runrunmao0202@gmail.com)  
- **GitHub**: [RunrunMaoGitHub](https://github.com/runrunmao)  

I’m always open to collaborating on interesting projects, discussing data trends, or exploring new opportunities. Feel free to reach out—I’d love to hear from you!
