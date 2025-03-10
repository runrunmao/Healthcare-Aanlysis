CREATE TABLE healthcare_data (
    Name TEXT,
    Age INT,
    Gender TEXT,
    Blood_Type TEXT,
    Medical_Condition TEXT,
    Date_of_Admission DATE,
    Doctor TEXT,
    Hospital TEXT,
    Insurance_Provider TEXT,
    Billing_Amount NUMERIC(10,2),
    Room_Number INT,
    Admission_Type TEXT,
    Discharge_Date DATE,
    Medication TEXT,
    Test_Results TEXT
);

SELECT * FROM healthcare_data;

SELECT *
INTO healthcare_data_backup_1
FROM healthcare_data;

-- Data Cleaning

-- 1. Standardizing the Name Column
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

SELECT * FROM healthcare_data ORDER BY visit_id;

--Now that our data is clean, we can perform analysis! 

