SELECT * FROM final_assessment_sql.countries;
USE final_assessment_sql;


-- Workforce Distribution

SELECT 
    department_id, COUNT(employee_id) AS employee_count
FROM
    employee_1
GROUP BY department_id
ORDER BY employee_count DESC;

-- Salary Comparison
SELECT 
    department_id, COUNT(employee_id) AS employee_count
FROM
    employee_1
GROUP BY department_id
ORDER BY employee_count DESC;

-- Salary Band For Employees

SELECT 
    CASE
        WHEN salary < 5000 THEN 'LOW'
        WHEN salary BETWEEN 5000 AND 10000 THEN 'MEDIUM'
        ELSE 'HIGH'
    END AS salary_band,
    COUNT(*) AS employee_count
FROM
    employee_1
GROUP BY salary_band;

-- Country-Level Analysis

SELECT 
    c.country_name,
    COUNT(DISTINCT d.department_id) AS department_count
FROM
    countries c
        JOIN
    departments_1 d ON c.country_id = d.location_id
GROUP BY c.country_name;

-- . High Earners

SELECT * FROM employee_1 WHERE salary > (SELECT AVG(salary) FROM employee_1);


-- Job Role Analysis

WITH JobSalaries AS (SELECT job_id,AVG(salary) AS average_salary FROM employee_1 GROUP BY job_id);


WITH job_salary_avg AS (
    SELECT
        job_id,
        AVG(salary) AS average_salary
    FROM employee_1
    GROUP BY job_id
)
SELECT
    job_id,
    average_salary
FROM job_salary_avg
WHERE average_salary > 12000;

-- Salary Growth Trend

SELECT
    c.country_name,
    SUM(e.salary) AS total_salary_cost
FROM employee_1 e
JOIN countries c
    ON e.country_id = c.country_id
GROUP BY c.country_name
ORDER BY total_salary_cost DESC;

-- Workforce Gap
SELECT
    j.job_id,
    j.job_title
FROM jobs j
LEFT JOIN employee_1 e
    ON j.job_id = e.job_id
WHERE e.job_id IS NULL;





