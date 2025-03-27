CREATE TABLE Customers (
  CustomerId INT PRIMARY KEY,
  Surname VARCHAR(255),
  CreditScore INT,
  Geography VARCHAR(255),
  Gender VARCHAR(255),
  Age INT,
  Tenure INT,
  Balance DECIMAL(10, 2),
  NumOfProducts INT,
  HasCrCard SMALLINT,
  IsActiveMember SMALLINT,
  EstimatedSalary DECIMAL(10, 2),
  Exited SMALLINT
);

SELECT* FROM Customers;

-- Customer demographic analysis
SELECT age, gender,geography,estimatedsalary,COUNT(*) as customer_count
FROM customers
GROUP BY age, gender, geography,  estimatedsalary
  LIMIT 10;

--transaction frequency
SELECT CustomerId,age,NumOfProducts AS transaction_frequency
FROM Customers
ORDER BY age DESC
LIMIT 30;


  --Geographic distribution
  SELECT Geography, COUNT(*) 
  FROM Customers 
  GROUP BY Geography
  ORDER BY Geography ASC;

--Average balance by age group
SELECT Age, AVG(Balance) AS AverageBalance
FROM  Customers
GROUP BY Age
ORDER BY Age DESC
LIMIT 10;


--Average number of products by gender 
 SELECT Gender, AVG(NumOfProducts) 
 FROM Customers 
 GROUP BY Gender;
 
--Customer Lifecycle 
SELECT CustomerId,Surname,
  CASE 
    WHEN Tenure < 5 THEN 'Prospect'
    WHEN Tenure > 6 THEN 'Loyal'
    ELSE 'Regular'
  END AS CustomerType
FROM Customers
LIMIT 20;

--Geographic Distribution of Customer Balances
SELECT Geography, SUM(Balance) AS TotalBalance
FROM Customers
GROUP BY Geography;

--Customer Credit Card Status
SELECT customerid,surname,
  CASE 
    WHEN hascrcard = 0 THEN 'deactivated'
    WHEN hascrcard = 1 THEN 'activated'
  END AS credit_card_status
FROM Customers
GROUP BY customerid, surname
LIMIT 30;


--High-Value Active Customer by salary
SELECT DISTINCT  customerid,surname,gender,geography, numofproducts,estimatedsalary
FROM Customers
WHERE  isactivemember = 1
ORDER BY estimatedsalary DESC
LIMIT 50;

--Geographic Distribution of Churn Customers
SELECT COUNT(customerid) AS num_churn_customers, geography AS state
FROM Customers
WHERE isactivemember = 0
GROUP BY geography;


