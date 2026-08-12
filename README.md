# 🏦 CM Bank DBMS

> A SQL Server based Database Management System designed to manage customers, accounts, transactions and loans for a banking environment.

---

## 📌 Project Overview

CM Bank DBMS is a relational database project developed using Microsoft SQL Server and T-SQL.

The system demonstrates how a banking organization can manage:

- 👤 Customer information
- 💳 Bank accounts
- 💰 Financial transactions
- 🏦 Loans
- 🔗 Relationships between entities
- 📊 SQL-based analysis and reporting

The project includes database design, table creation, constraints, sample data and 17 SQL queries ranging from basic retrieval to advanced analytical SQL.

---

## 🎯 Objectives

- Design a structured relational banking database.
- Maintain data integrity using primary and foreign keys.
- Store customer and financial information efficiently.
- Track account transactions.
- Manage customer loans.
- Perform analytical queries using T-SQL.
- Demonstrate SQL joins, aggregation, CTEs and window functions.

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Microsoft SQL Server | Database Management |
| T-SQL | Query Language |
| SQL Server Management Studio | Database Development |
| Microsoft PowerPoint | Project Presentation |
| GitHub | Version Control & Documentation |

---

## 🗂️ Database Entities

The database contains four major entities:

### 👤 Customers

Stores customer information.

Important attributes:

- CustomerID
- FirstName
- LastName
- City

### 💳 Accounts

Stores bank account information.

Important attributes:

- AccountID
- CustomerID
- AccountType
- Balance

### 💰 Transactions

Stores financial transactions.

Important attributes:

- TransactionID
- AccountID
- TransactionType
- Amount
- TransactionDate

### 🏦 Loans

Stores customer loan information.

Important attributes:

- LoanID
- CustomerID
- LoanType
- LoanAmount

---

## 🔗 Database Relationships

```text
Customers
    │
    ├────────── Accounts
    │               │
    │               └──────── Transactions
    │
    └────────── Loans
