--Q11 Remote Work Trends
SELECT remote_ratio, AVG(salary_in_usd), MAX(salary_in_usd), MIN(salary_in_usd), COUNT(salary_in_usd)
FROM salaries 
GROUP BY remote_ratio
ORDER BY remote_ratio DESC;



SELECT remote_ratio, company_size, COUNT(salary_in_usd)
FROM salaries 
GROUP BY company_size, remote_ratio
ORDER BY remote_ratio DESC, company_size;

--Q12 Best Paying Job Titles
SELECT experience_level, job_title, AVG(salary_in_usd) AS avg_salary, COUNT(job_title) AS job_count
FROM salaries 
GROUP BY experience_level, job_title
ORDER BY experience_level, avg_salary DESC;

--Q13 Experience Level & Work Type Distribution
SELECT experience_level, employment_type, AVG(salary_in_usd) AS avg_salary, COUNT(employment_type) AS employment_type_count
FROM salaries 
GROUP BY experience_level, employment_type
ORDER BY experience_level, avg_salary DESC;

--Q14 Industry Growth Trends
SELECT work_year, AVG(salary_in_usd) AS avg_salary, COUNT(*) AS count_job
FROM salaries 
GROUP BY work_year
ORDER BY work_year DESC;

--Industry Growth Trends_experience level
SELECT experience_level, work_year, COUNT(*) AS count_job
FROM salaries 
GROUP BY work_year, experience_level
ORDER BY experience_level, work_year DESC;

--Industry Growth Trends_employment_type
SELECT employment_type, work_year, COUNT(*) AS count_job
FROM salaries 
GROUP BY work_year, employment_type
ORDER BY employment_type, work_year DESC