CREATE DATABASE ASSIGNMENT;
USE ASSIGNMENT;

--Customer Table
CREATE TABLE Customers(
Customer_id INT PRIMARY KEY,
Customer_name VARCHAR(50),
Phone_No VARCHAR(20),
City VARCHAR(50),
Account_Type VARCHAR(50),
Account_No INT
);

ALTER TABLE Customers
ALTER COLUMN Phone_No VARCHAR(20);	

--Accounts Table
CREATE TABLE Accounts(
Account_id INT PRIMARY KEY,
Customer_id INT,
Balance INT,
OpenDate DATE,
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
);

--Transactions Table
CREATE TABLE Transactions(
Transaction_id INT PRIMARY KEY,
Account_id INT,
Transaction_type VARCHAR(50),
Amount INT,
Transaction_date DATE,
FOREIGN KEY (Account_id) REFERENCES Accounts(Account_id)
);

--Loan Table
CREATE TABLE Loan(
Loan_id INT PRIMARY KEY,
Customer_id INT,
Loan_Amount INT,
Loan_Type VARCHAR(20),
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
);


INSERT INTO Customers
(Customer_id, Customer_name, Phone_No, City, Account_Type, Account_No)
VALUES
(1, 'Rahul Sharma', 9876543210, 'Pune', 'Savings', 1001),
(2, 'Sneha Patil', 9988776655, 'Mumbai', 'Current', 1002),
(3, 'Aman Verma', 9123456780, 'Nagpur', 'Savings', 1003),
(4, 'Priya Singh', 9012345678, 'Delhi', 'Current', 1004),
(5, 'Karan Mehta', 9871203456, 'Hyderabad', 'Savings', 1005),
(6, 'Neha Joshi', 9988001122, 'Pune', 'Current', 1006),
(7, 'Rohit Kumar', 9765432109, 'Bangalore', 'Savings', 1007),
(8, 'Pooja Sharma', 9876540001, 'Chennai', 'Savings', 1008),
(9, 'Vivek Shah', 9001122334, 'Ahmedabad', 'Current', 1009),
(10, 'Anjali Verma', 9988771100, 'Jaipur', 'Savings', 1010);

INSERT INTO Accounts
(Account_id, Customer_id, Balance, OpenDate)
VALUES
(1001, 1, 55000, '2025-01-10'),
(1002, 2, 120000, '2024-11-20'),
(1003, 3, 35000, '2025-03-15'),
(1004, 4, 98000, '2025-02-01'),
(1005, 5, 75000, '2025-01-25'),
(1006, 6, 150000, '2024-12-18'),
(1007, 7, 42000, '2025-04-10'),
(1008, 8, 88000, '2025-05-05'),
(1009, 9, 200000, '2024-09-30'),
(1010, 10, 67000, '2025-03-22');

INSERT INTO Transactions
(Transaction_id, Account_id, Transaction_type, Amount, Transaction_date)
VALUES
(1, 1001, 'Deposit', 10000, '2026-06-01'),
(2, 1001, 'Withdraw', 5000, '2026-06-02'),
(3, 1002, 'Deposit', 25000, '2026-06-02'),
(4, 1003, 'Withdraw', 3000, '2026-06-03'),
(5, 1004, 'Deposit', 15000, '2026-06-04'),
(6, 1005, 'Deposit', 12000, '2026-06-05'),
(7, 1006, 'Withdraw', 7000, '2026-06-05'),
(8, 1007, 'Deposit', 9000, '2026-06-06'),
(9, 1008, 'Withdraw', 4500, '2026-06-06'),
(10, 1009, 'Deposit', 30000, '2026-06-07'),
(11, 1010, 'Withdraw', 2000, '2026-06-07'),
(12, 1002, 'Withdraw', 10000, '2026-06-08'),
(13, 1003, 'Deposit', 5000, '2026-06-08'),
(14, 1005, 'Withdraw', 3500, '2026-06-09'),
(15, 1007, 'Deposit', 15000, '2026-06-09');

INSERT INTO Loan
(Loan_id, Customer_id, Loan_Amount, Loan_Type)
VALUES
(1, 1, 500000, 'Home Loan'),
(2, 2, 200000, 'Car Loan'),
(3, 4, 100000, 'Education Loan'),
(4, 5, 300000, 'Business Loan'),
(5, 6, 150000, 'Personal Loan'),
(6, 8, 250000, 'Home Loan'),
(7, 9, 400000, 'Business Loan'),
(8, 10, 180000, 'Car Loan');

SELECT *FROM  Customers;
SELECT *FROM  Accounts;
SELECT *FROM  Transactions;
SELECT *FROM  Loan;

/*********************SQL PRACTICE QUESTION***************************/
/*1. Display customer names, account numbers, and account balances using INNER JOIN.
2. Find the top 3 customers with the highest account balances.
3. Show all customers who have taken loans along with loan amount and loan type.
4. Find the total deposited amount and total withdrawn amount separately.
5. Display customer-wise total transaction amount using GROUP BY.
6. Find customers whose balances are greater than the average bank balance.
7. Show the highest transaction amount performed by each customer.
8. Display all customers who have not taken any loans using LEFT JOIN.
9. Find the total number of transactions performed by each customer.
10. Rank customers based on their account balances using RANK() window function.
11. Display dense ranking of customers according to balance using DENSE_RANK().
12. Show previous transaction amount using LAG() function.
13. Show next transaction amount using LEAD() function.
14. Calculate running total of transaction amounts using SUM() OVER().
15. Find the second highest account balance using subquery or window function.
16. Find customers who performed more than 2 transactions.
17. Display customer-wise minimum and maximum transaction amounts*/


--1. Display customer names, account numbers, and account balances using INNER JOIN.
SELECT c.Customer_name,c.Account_No,a.Balance
from Customers c inner join Accounts a
on c.Customer_id = a.Customer_id;
--2. Find the top 3 customers with the highest account balances.
SELECT TOP 3 
c.Customer_name,c.Account_No,a.Balance
from Customers c inner join Accounts a
on c.Customer_id = a.Customer_id
ORDER BY a.Balance DESC;
--3. Show all customers who have taken loans along with loan amount and loan type.
SELECT c.Customer_name,l.Loan_Amount,l.Loan_Type
from Customers c inner join Loan l
on c.Customer_id = l.Customer_id;
--4. Find the total deposited amount and total withdrawn amount separately.
SELECT Transaction_type,sum(Amount)as TOTAL_AMOUNT
FROM Transactions
GROUP BY Transaction_type;
--5. Display customer-wise total transaction amount using GROUP BY.
SELECT c.Customer_name,SUM(t.Amount) AS TOTAL_TRANSACTION_AMOUNT
FROM Customers c inner join Transactions t
on c.Customer_id = (SELECT a.Customer_id FROM Accounts a WHERE a.Account_id = t.Account_id)
group by c.Customer_name;
--6. Find customers whose balances are greater than the average bank balance.
select c.Customer_name,c.Account_No,a.Balance
from Customers c inner join Accounts a
on c.Customer_id = a.Customer_id
where a.Balance > (select avg(Balance) from Accounts);
--7. Show the highest transaction amount performed by each customer.
SELECT c.Customer_name,MAX(t.Amount) AS HIGHEST_TRANSACTION_AMOUNT
FROM Customers c inner join Transactions t
on c.Customer_id = (SELECT a.Customer_id FROM Accounts a WHERE a.Account_id = t.Account_id)
group BY c.Customer_name;
--8. Display all customers who have not taken any loans using LEFT JOIN.
select c.Customer_name,c.Account_No,l.Loan_type
from Customers c left join Loan l
on c.Customer_id = l.Customer_id
where l.Loan_type = NULL;
--9. Find the total number of transactions performed by each customer.
SELECT c.Customer_name,SUM(t.Transaction_id) AS TOTAL_TRANSACTIONs
FROM Customers c inner join Transactions t
on c.Customer_id = (SELECT a.Customer_id FROM Accounts a WHERE a.Account_id = t.Account_id)
group by c.Customer_name;
--10. Rank customers based on their account balances using RANK() window function.
select c.Customer_name,c.Account_No,a.Balance,
RANK() OVER(ORDER BY a.Balance DESC) AS RANKING
from Customers c inner join Accounts a
on c.Customer_id = a.Customer_id;
--11. Display dense ranking of customers according to balance using DENSE_RANK().
select c.Customer_name,c.Customer_id,a.Balance,
dense_rank()over(order by Balance desc)as dense_ranking
from Customers c inner join Accounts a
on c.Customer_id = a.Customer_id;
--12. Show previous transaction amount using LAG() function.
select Amount,
lag(Amount)over(order by Amount)as previous_amount
from Transactions;
--13. Show next transaction amount using LEAD() function.
select Amount,
lead(Amount)over(order by Amount)as previous_amount
from Transactions;
--14. Calculate running total of transaction amounts using SUM() OVER().
select Amount, 
sum(Amount)over (order by Amount )as running_total_transaction_amount
from Transactions;
--15. Find the second highest account balance using subquery or window function.
select Balance ,
dense_rank()over(order by Balance desc)as dense_ranking
from Accounts
where dense_ranking = 2;

--16. Find customers who performed more than 2 transactions.
/*select c.Customer_id,c.Customer_name,t.Account_id,t.Transaction_type
from Customers c right join Transactions t
on c.Customer_id = (SELECT a.Customer_id FROM Accounts a WHERE a.Account_id = t.Account_id)
where t.Transaction_id > 2;*/

/*select c.Customer_id,c.Customer_name,count(t.Transaction_id) as TRANSACTION_COUNT
from Customers c  join Accounts a
on c.Customer_id = a.Customer_id
				  join Transactions t
on a.Account_id = t.Account_id
group by  c.Customer_id,c.Customer_name
having count( t.Transaction_id) > 2;
*/
SELECT
    c.Customer_id,
    c.Customer_name,
    COUNT(t.Transaction_id) AS Transaction_Count
FROM Customers c
JOIN Accounts a
    ON c.Customer_id = a.Customer_id
JOIN Transactions t
    ON a.Account_id = t.Account_id
GROUP BY c.Customer_id, c.Customer_name
HAVING COUNT(t.Transaction_id) > 2;


--17. Display customer-wise minimum and maximum transaction amounts
SELECT
    c.Customer_id,
    c.Customer_name,
    MIN(t.Amount) AS Min_Transaction_Amount,
    MAX(t.Amount) AS Max_Transaction_Amount
FROM Customers c
JOIN Accounts a
    ON c.Customer_id = a.Customer_id
JOIN Transactions t
    ON a.Account_id = t.Account_id
GROUP BY c.Customer_id, c.Customer_name;

