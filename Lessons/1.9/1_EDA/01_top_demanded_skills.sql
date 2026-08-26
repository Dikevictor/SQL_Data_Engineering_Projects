/*
Question: What are the most in-demand skills for data engineers? 

- Identify the top 10 in-demand skills for data engineers
- Focus on remote job postings
- Why? 
    - Retrieves the top 10 skills with the highest demand in the remote job
    market, providing insight into the most valuable skills for data engineers 
    seeking remote work
*/

/* 

SELECT 
    COUNT(jd.skill_id) AS Skill_Count,
    sd.skills

FROM job_postings_fact jp
LEFT JOIN skills_job_dim as jd ON jd.job_id = jp.job_id
LEFT JOIN skills_dim as sd ON sd.skill_id = jd.skill_id

WHERE 
    jp.job_title_short = 'Data Engineer' AND
    job_country = 'Nigeria'
    

GROUP BY
    sd.skills
ORDER BY 
   Skill_Count DESC

LIMIT 10;

*/ 

/*
I want to see the top 10 companies offering DE jobs in Nigeria (I will also check DA)

just count the top 10 companies that post the most in Nigeria
find the associated skill
*/

DESCRIBE job_postings_fact;
DESCRIBE skills_dim;
DESCRIBE skills_job_dim;
DESCRIBE company_dim;

SHOW ALL TABLES;
SHOW TABLES;


SELECT 
    COUNT(jpf.job_id) AS Job_Post_Count,
    -- jpf.company_id,
    cd.name AS Company

FROM job_postings_fact jpf
INNER JOIN company_dim cd ON cd.company_id = jpf.company_id

WHERE jpf.job_title_short IN ('Data Engineer', 'Data Analyst') AND 
        jpf.job_country = 'Nigeria' AND
        job_work_from_home = TRUE

GROUP BY
    jpf.company_id,
    cd.name

ORDER BY
    Job_Post_Count DESC

LIMIT 20;

