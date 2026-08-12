# 🏦 CM Bank DBMS — Project Documentation

> A relational Database Management System designed to manage customers, bank accounts, transactions, and loans using Microsoft SQL Server and T-SQL.

---

## 📌 1. Project Overview

The **CM Bank Database Management System (DBMS)** is a relational database project developed to simulate the core data management operations of a banking system.

The system is designed to organize and manage important banking information such as:

- Customer details
- Bank accounts
- Account balances
- Financial transactions
- Customer loans
- Relationships between banking entities

The project demonstrates the practical implementation of **relational database concepts, SQL queries, constraints, joins, aggregation, CTEs, and window functions**.

---

# 🎯 2. Project Objectives

The main objectives of the CM Bank DBMS are:

1. Design a structured relational banking database.
2. Store customer information efficiently.
3. Manage multiple bank accounts.
4. Track deposits and withdrawals.
5. Maintain customer loan information.
6. Establish relationships between database tables.
7. Maintain data integrity using constraints.
8. Perform data analysis using T-SQL.
9. Demonstrate different SQL querying techniques.
10. Generate meaningful results from banking data.

---

# 🏦 3. Business Problem

A banking organization manages a large amount of interconnected data.

Customer information, account information, transactions, and loans need to be stored in a structured manner so that the bank can:

- Retrieve customer information quickly.
- Monitor account balances.
- Track financial transactions.
- Analyze loan portfolios.
- Maintain accurate relationships between records.
- Generate reports for decision-making.
- Protect data integrity.

The CM Bank DBMS addresses these requirements by implementing a relational database structure.

---

# 🗄️ 4. Database Components

The database consists of four major entities:

| Entity | Description |
|---|---|
| Customers | Stores customer information |
| Accounts | Stores bank account information |
| Transactions | Stores financial transactions |
| Loans | Stores customer loan information |

---

# 👤 5. Customers Table

The `Customers` table stores information about bank customers.

### Important Attributes

| Column | Description |
|---|---|
| CustomerID | Unique customer identifier |
| FirstName | Customer first name |
| LastName | Customer last name |
| City | Customer city |

### Purpose

This table acts as the primary customer/master table and is referenced by other banking entities.

---

# 💳 6. Accounts Table

The `Accounts` table stores information about customer bank accounts.

### Important Attributes

| Column | Description |
|---|---|
| AccountID | Unique account identifier |
| CustomerID | Customer who owns the account |
| AccountType | Type of bank account |
| Balance | Current account balance |

### Purpose

The table allows the bank to maintain account ownership and financial balances.

---

# 💰 7. Transactions Table

The `Transactions` table records financial activities performed on bank accounts.

### Important Attributes

| Column | Description |
|---|---|
| TransactionID | Unique transaction identifier |
| AccountID | Account associated with the transaction |
| TransactionType | Deposit or withdrawal |
| Amount | Transaction amount |
| TransactionDate | Date of transaction |

### Purpose

This table provides a history of financial movements associated with customer accounts.

---

# 🏦 8. Loans Table

The `Loans` table stores information about loans provided to customers.

### Important Attributes

| Column | Description |
|---|---|
| LoanID | Unique loan identifier |
| CustomerID | Customer who owns the loan |
| LoanType | Type of loan |
| LoanAmount | Total loan amount |

### Purpose

This table allows the bank to manage and analyze its loan portfolio.

---

# 🔗 9. Database Relationships

The database follows a relational structure.

```text
                     ┌───────────────┐
                     │   Customers   │
                     └───────┬───────┘
                             │
                    ┌────────┴────────┐
                    │                 │
                    ▼                 ▼
             ┌────────────┐     ┌────────────┐
             │  Accounts  │     │   Loans    │
             └─────┬──────┘     └────────────┘
                   │
                   ▼
            ┌──────────────┐
            │ Transactions │
            └──────────────┘
