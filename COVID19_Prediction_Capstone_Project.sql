/*1. Find the number of corona patients who faced shortness of breath.*/

SELECT COUNT(*) AS num_patients_shortness_of_breath
FROM df1
WHERE Corona = 'positive' AND Shortness_of_breath = 'TRUE';

/*2. Find the number of negative corona patients who have fever and sore_throat. */

SELECT COUNT(*) AS num_negative_patients_fever_sore_throat
FROM df1
WHERE Corona = 'negative' AND Fever = 'TRUE' AND Sore_throat = 'TRUE';

/*3. Group the data by month and rank the number of positive cases.*/

SELECT EXTRACT(MONTH FROM Test_date) AS month_, COUNT(*) AS num_positive_cases,        
       RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_
FROM df1
WHERE Corona = 'positive'
GROUP BY month_;

/*4. Find the female negative corona patients who faced cough and headache.*/

SELECT COUNT(*) AS num_female_negative_patients_cough_headache
FROM df1
WHERE Corona = 'negative' AND Sex = 'female' AND Cough_symptoms = 'TRUE' AND Headache = 'TRUE';

/*5. How many elderly corona patients have faced breathing problems?*/

SELECT COUNT(*) AS num_elderly_patients_breathing_problems
FROM df1
WHERE Corona = 'positive' AND Age_60_above = 'TRUE' AND Shortness_of_breath = 'TRUE';

/*6. Which three symptoms were more common among COVID positive patients?*/

SELECT Cough_symptoms, Fever, Sore_throat, COUNT(*) AS num_cases
FROM df1
WHERE Corona = 'positive'
GROUP BY Cough_symptoms, Fever, Sore_throat
ORDER BY num_cases DESC
LIMIT 3;

/*7. Which symptom was less common among COVID negative people?*/

SELECT CASE
    WHEN Cough_symptoms = 'TRUE' THEN 'Cough'
    WHEN Fever = 'TRUE' THEN 'Fever'
    WHEN Sore_throat = 'TRUE' THEN 'Sore throat'
    WHEN Shortness_of_breath = 'TRUE' THEN 'Shortness of breath'
    WHEN Headache = 'TRUE' THEN 'Headache'
    ELSE 'No symptoms'
    END AS symptom, COUNT(*) AS num_negative_cases
FROM df1
WHERE Corona = 'negative'
GROUP BY symptom
ORDER BY num_negative_cases
LIMIT 5;

/*8. What are the most common symptoms among COVID positive males whose known contact was abroad? */

SELECT Cough_symptoms, Fever, Sore_throat, Headache, Shortness_of_breath, COUNT(*) AS num_cases
FROM df1
WHERE Corona = 'positive' AND Sex = 'male' AND Known_contact = 'Abroad'
GROUP BY Cough_symptoms, Fever, Sore_throat, Headache, Shortness_of_breath
ORDER BY num_cases DESC
LIMIT 1;










