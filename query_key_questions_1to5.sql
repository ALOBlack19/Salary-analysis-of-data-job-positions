
-- Checking database values
select
	*
from
	salaries s 

/*
BASIC STATISTICS

COUNTING TOTAL and DISTINCT job positions
 */
SELECT
	COUNT(DISTINCT s.job_title)
FROM
	salaries s

	
SELECT 
	s.job_title,
	COUNT(s.job_title)
FROM	
	salaries s
GROUP BY	
	s.job_title
ORDER BY 
	COUNT(s.job_title) DESC
LIMIT
	10;

-- Career Choice & Job Trends

-- 1. Best Roles (part-time) for Beginners

SELECT 
	s.experience_level,
	s.job_title,
	s.employment_type,
	ROUND(AVG(s.salary_in_usd),2) AS average_salary
FROM	
	salaries s
WHERE
	s.experience_level = 'EN'
	AND s.employment_type = 'PT'
GROUP BY
	s.job_title,
	s.experience_level,
	s.employment_type
ORDER BY
	AVG(s.salary_in_usd) DESC
LIMIT 10;

-- 1.2. Best Roles (full-time) for Beginners

SELECT 
	s.experience_level,
	s.job_title,
	s.employment_type,
	ROUND(AVG(s.salary_in_usd),2) AS average_salary
FROM	
	salaries s
WHERE
	s.experience_level = 'EN'
GROUP BY
	s.job_title,
	s.experience_level,
	s.employment_type
ORDER BY
	AVG(s.salary_in_usd) DESC
LIMIT 10;

-- 2. Remote, Hybrid, or In-Person Preferences

SELECT 
	COUNT(s.job_title) AS total_work_types,
	s.remote_ratio
FROM
	salaries s
GROUP BY
	s.remote_ratio
ORDER BY 
	COUNT(s.job_title) DESC
	
-- 2.2. Remote, Hybrid, or In-Person by company location
-- ONLINE
	
SELECT 
    COUNT(job_title ) AS total_work_types,
    s.company_location,
    s.remote_ratio    
FROM
    salaries s
WHERE
	s.remote_ratio = '100'
GROUP BY
    s.remote_ratio,
    s.company_location
ORDER BY 
    total_work_types DESC
LIMIT 10

-- HYBRID

SELECT 
    COUNT(job_title ) AS total_work_types,
    s.company_location,
    s.remote_ratio    
FROM
    salaries s
WHERE
	s.remote_ratio = '50'
GROUP BY
    s.remote_ratio,
    s.company_location
ORDER BY 
    total_work_types DESC
LIMIT 10

-- IN-PERSON

SELECT 
    COUNT(job_title ) AS total_work_types,
    s.company_location,
    s.remote_ratio    
FROM
    salaries s
WHERE
	s.remote_ratio = '0'
GROUP BY
    s.remote_ratio,
    s.company_location
ORDER BY 
    total_work_types DESC
LIMIT 10

-- 3. Career Growth Potential

SELECT
	s.experience_level, 
	ROUND(AVG(s.salary_in_usd),2) AS average_salary,
	s.work_year
FROM
	salaries s
GROUP BY
	s.work_year,
	s.experience_level
ORDER BY
	s.work_year,
	CASE 
        WHEN s.experience_level = 'EN' THEN 1
        WHEN s.experience_level = 'MI' THEN 2
        WHEN s.experience_level = 'SE' THEN 3
        WHEN s.experience_level = 'EX' THEN 4
    END;

-- 3.2. Career Growth Potential (data scientists)

SELECT
	s.experience_level, 
	ROUND(AVG(s.salary_in_usd),2) AS average_salary,
	s.work_year
FROM
	salaries s
WHERE
	s.job_title = 'Data Scientist'
GROUP BY
	s.work_year,
	s.experience_level
ORDER BY
	s.work_year,
	CASE 
        WHEN s.experience_level = 'EN' THEN 1
        WHEN s.experience_level = 'MI' THEN 2
        WHEN s.experience_level = 'SE' THEN 3
        WHEN s.experience_level = 'EX' THEN 4
    END;

-- 4. Comparing earnings across employment_type 
-- 	  and the most common employment type.
SELECT
	s.employment_type,
	COUNT(s.employment_type) AS total_jobs_types,
	AVG(s.salary_in_usd) AS avg_salary_job_type
FROM
	salaries s
GROUP BY
	s.employment_type
ORDER BY
	CASE 
        WHEN s.employment_type = 'PT' THEN 1
        WHEN s.employment_type = 'FT' THEN 2
        WHEN s.employment_type = 'CT' THEN 3
        WHEN s.employment_type = 'FL' THEN 4
	END;

-- 4.2. Comparing Data Scientists earnings across employment_type
-- 		and the most common employment type.
SELECT
	s.employment_type,
	COUNT(s.employment_type) AS total_jobs_types,
	ROUND(AVG(s.salary_in_usd),2) AS avg_salary_job_type
FROM
	salaries s
WHERE 
	s.job_title = 'Data Scientist'
GROUP BY
	s.employment_type
ORDER BY
	CASE 
        WHEN s.employment_type = 'PT' THEN 1
        WHEN s.employment_type = 'FT' THEN 2
        WHEN s.employment_type = 'CT' THEN 3
        WHEN s.employment_type = 'FL' THEN 4
	END;



