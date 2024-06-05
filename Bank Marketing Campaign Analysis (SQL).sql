--                                              Bank Marketing Compaign Analysis



-- 1) Get the total number of records in the dataset
SELECT COUNT(*) AS total_records
FROM bank;


-- 2) Distribution of Age Groups
select Age_Group,count(Age_Group) as Count_of_Age_Group from bank
group by Age_Group
order by Count_of_Age_Group desc;



-- 3) Average Balance by Job:
SELECT JOB,AVG(bALANCE) as Avg_Bank_Balance FROM BANK
GROUP BY Job
order by Avg_Bank_Balance desc;


-- 4) Campaign Success Rate by Education Level:
SELECT education, 
       COUNT(*) AS total,
       SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS successful,
       (SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS success_rate
FROM bank
GROUP BY education
ORDER BY success_rate DESC;


-- 5) Monthly Campaign Performance:
-- Get the number of successful deposits for each month
SELECT month, 
       COUNT(*) AS total,
       SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS successful,
       (SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS success_rate
FROM bank
GROUP BY month
ORDER BY success_rate desc;


-- 6) Contact Duration and Campaign Outcome:
-- Analyze the average duration of contacts that resulted in a successful deposit
SELECT 
    AVG(CASE WHEN deposit = 'yes' THEN duration ELSE NULL END) AS avg_successful_duration,
    AVG(CASE WHEN deposit = 'no' THEN duration ELSE NULL END) AS avg_unsuccessful_duration
FROM bank;


-- 7) Campaign Effectiveness by Marital Status:
-- Calculate the success rate of the campaign for each marital status
SELECT marital, 
       COUNT(*) AS total,
       SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS successful,
       (SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS success_rate
FROM bank
GROUP BY marital
ORDER BY success_rate desc;


-- 8) Impact of Contact Type:
-- Determine the impact of the contact type on campaign success
SELECT contact, 
       COUNT(*) AS total,
       SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS successful,
       (SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS success_rate
FROM bank
GROUP BY contact
ORDER BY success_rate desc;


-- 9) Correlation between Loan and Housing:
-- Find out how many people have both a loan and a housing loan
SELECT 
    SUM(CASE WHEN housing = 'yes' AND loan = 'yes' THEN 1 ELSE 0 END) AS both_loan_and_housing,
    SUM(CASE WHEN housing = 'yes' AND loan = 'no' THEN 1 ELSE 0 END) AS only_housing,
    SUM(CASE WHEN housing = 'no' AND loan = 'yes' THEN 1 ELSE 0 END) AS only_loan,
    SUM(CASE WHEN housing = 'no' AND loan = 'no' THEN 1 ELSE 0 END) AS neither
FROM bank;

-- 10) Effect of Previous Campaign Outcome:
-- Analyze how the previous campaign outcome affected the current campaign's success
SELECT poutcome,
       COUNT(*) AS total,
       SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS successful,
       (SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS success_rate
FROM bank_marketing
GROUP BY poutcome;


-- 11) Impact of Having a Loan on Deposit Subscription:
-- Determine the impact of having a loan on the campaign's success
SELECT loan, 
       COUNT(*) AS total,
       SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS successful,
       (SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS success_rate
FROM bank
GROUP BY loan
ORDER BY success_rate DESC;


-- 12) Distribution of Clients by Job Type:
-- Find out the distribution of clients by job type
SELECT job, COUNT(*) AS total
FROM bank
GROUP BY job
ORDER BY total DESC;

