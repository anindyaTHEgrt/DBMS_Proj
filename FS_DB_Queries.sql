-- 1. *Query to find users who own specific stocks and real estate:*
-- works
SELECT u.fname, u.sname
FROM User u
JOIN UserAssets ua ON u.id = ua.user_id
JOIN Stocks s ON ua.stock_id = s.id
JOIN RealEstate re ON ua.real_estate_id = re.id
WHERE s.stockname = 'BlueCoast Meridian' AND re.property_name = 'Rustomjee';


-- 2. *Query to list all the stocks owned by a specific user:*
-- works
SELECT s.stockname
FROM User u
JOIN UserAssets ua ON u.id = ua.user_id
JOIN Stocks s ON ua.stock_id = s.id
WHERE u.fname = 'Rhea';


-- 3. *Query to find users who own both mutual funds and real estate:*
-- works
SELECT u.fname, u.sname
FROM User u
JOIN UserAssets ua ON u.id = ua.user_id
JOIN MutualFunds mf ON ua.mutual_fund_id = mf.id
JOIN RealEstate re ON ua.real_estate_id = re.id;


-- 4. *Query to calculate the total value of assets (stocks, mutual funds, real estate) owned by each user:*
-- works
SELECT u.fname, u.sname,
       SUM(s.current_rate) AS total_stock_value,
       SUM(mf.current_value) AS total_mutual_fund_value,
       SUM(re.estimated_value) AS total_real_estate_value,
       SUM(s.current_rate) + SUM(mf.current_value) + SUM(re.estimated_value) AS total_assets_value
FROM User u
JOIN UserAssets ua ON u.id = ua.user_id
LEFT JOIN Stocks s ON ua.stock_id = s.id
LEFT JOIN MutualFunds mf ON ua.mutual_fund_id = mf.id
LEFT JOIN RealEstate re ON ua.real_estate_id = re.id
GROUP BY u.id;


-- 5. *Query to find users who own assets with a total value greater than a certain amount:*
-- ok
SELECT u.fname, u.sname
FROM User u
JOIN UserAssets ua ON u.id = ua.user_id
LEFT JOIN Stocks s ON ua.stock_id = s.id
LEFT JOIN MutualFunds mf ON ua.mutual_fund_id = mf.id
LEFT JOIN RealEstate re ON ua.real_estate_id = re.id
GROUP BY u.id
HAVING SUM(s.current_rate) + SUM(mf.current_value) + SUM(re.estimated_value) > 500000;


-- 6. See if contact person and user is linked
SELECT 
    u.id AS user_id,
    u.fname AS user_fname,
    u.sname AS user_sname,
    u.mail AS user_email,
    cp.id AS contact_person_id,
    cp.name AS contact_person_name,
    cp.email AS contact_person_email
FROM 
    User u
INNER JOIN 
    ContactPerson cp ON u.advisor_id = cp.id;
-- 7    
SELECT u.*, j.position, j.sector, j.branch, j.salary
FROM User u
INNER JOIN Job j ON u.jobname = j.jobname;

SELECT *
FROM User u
INNER JOIN HealthInsurance hi ON u.health_insurance_id = hi.id
WHERE hi.premium > 2500.00;

SELECT *
FROM User u
INNER JOIN TermLifeInsurance tli ON u.term_life_insurance_id = tli.id
WHERE tli.coverage_amount > 700000.00;

SELECT AVG(hi.premium) AS average_health_insurance_premium
FROM User u
INNER JOIN HealthInsurance hi ON u.health_insurance_id = hi.id
WHERE u.age >= 30;

SELECT u.*, s.stockname, s.current_rate
FROM User u
LEFT JOIN UserAssets ua ON u.id = ua.user_id
LEFT JOIN Stocks s ON ua.stock_id = s.id;

SELECT *
FROM User u
WHERE u.health_insurance_id IS NOT NULL AND u.term_life_insurance_id IS NOT NULL;

SELECT COUNT(*) AS total_users_with_advisors
FROM User
WHERE advisor_id IS NOT NULL;
