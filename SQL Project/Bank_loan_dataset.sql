create database bank_loan_dataset;
USE bank_loan_dataset;
SELECT * FROM financial_loan LIMIT 5;

######### Total Loan Applications
SELECT COUNT(id) AS Total_Applications FROM financial_loan;

##### MTD Loan Applications
SELECT COUNT(id) AS Total_Applications FROM financial_loan
WHERE MONTH(issue_date) = 12;

SELECT issue_date
FROM financial_loan
LIMIT 10;

SELECT COUNT(id) AS Total_Applications
FROM financial_loan
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 12
  AND YEAR(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 2021;


SELECT 
    MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) AS month_num,
    COUNT(*) AS total
FROM financial_loan
GROUP BY month_num
ORDER BY month_num;

##### Total Loan Applications
SELECT COUNT(id) AS Total_Applications
FROM financial_loan;

#### MTD Loan Applications (Month = 12)
SELECT COUNT(id) AS Total_Applications
FROM financial_loan
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 12;

##### PMTD Loan Applications (Month = 11)
SELECT COUNT(id) AS Total_Applications
FROM financial_loan
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 11;

###### Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount
FROM financial_loan;

###### MTD Total Funded Amount (Month = 12)
SELECT SUM(loan_amount) AS Total_Funded_Amount
FROM financial_loan
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 12;

#### PMTD Total Funded Amount (Month = 11)
SELECT SUM(loan_amount) AS Total_Funded_Amount
FROM financial_loan
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 11;

#### Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected
FROM financial_loan;

#### MTD Total Amount Received (Month = 12)
SELECT SUM(total_payment) AS Total_Amount_Collected
FROM financial_loan
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 12;

##### PMTD Total Amount Received (Month = 11)
SELECT SUM(total_payment) AS Total_Amount_Collected
FROM financial_loan
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 11;


#### verage Interest Rate
SELECT AVG(int_rate) * 100 AS Avg_Int_Rate
FROM financial_loan;

## MTD Average Interest (Month = 12)
SELECT AVG(int_rate) * 100 AS MTD_Avg_Int_Rate
FROM financial_loan
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 12;

## PMTD Average Interest (Month = 11)
SELECT AVG(int_rate) * 100 AS PMTD_Avg_Int_Rate
FROM financial_loan
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 11;


## 13) Avg DTI


SELECT AVG(dti) * 100 AS Avg_DTI
FROM financial_loan;


## 14) MTD Avg DTI (Month = 12)

SELECT AVG(dti) * 100 AS MTD_Avg_DTI
FROM financial_loan
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 12;


## 15) PMTD Avg DTI (Month = 11)

SELECT AVG(dti) * 100 AS PMTD_Avg_DTI
FROM financial_loan
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 11;

#  GOOD LOAN ISSUED

## 16) Good Loan Percentage


SELECT
    (COUNT(CASE WHEN loan_status IN ('Fully Paid', 'Current') THEN id END) * 100.0) / COUNT(id)
    AS Good_Loan_Percentage
FROM financial_loan;


## 17) Good Loan Applications


SELECT COUNT(id) AS Good_Loan_Applications
FROM financial_loan
WHERE loan_status IN ('Fully Paid', 'Current');


## 18) Good Loan Funded Amount


SELECT SUM(loan_amount) AS Good_Loan_Funded_amount
FROM financial_loan
WHERE loan_status IN ('Fully Paid', 'Current');


## 19) Good Loan Amount Received


SELECT SUM(total_payment) AS Good_Loan_amount_received
FROM financial_loan
WHERE loan_status IN ('Fully Paid', 'Current');

## BAD LOAN ISSUED

## 20) Bad Loan Percentage


SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / COUNT(id)
    AS Bad_Loan_Percentage
FROM financial_loan;

## Bad Loan Applications


SELECT COUNT(id) AS Bad_Loan_Applications
FROM financial_loan
WHERE loan_status = 'Charged Off';


## 22) Bad Loan Funded Amount

SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount
FROM financial_loan
WHERE loan_status = 'Charged Off';


## 23) Bad Loan Amount Received


SELECT SUM(total_payment) AS Bad_Loan_amount_received
FROM financial_loan
WHERE loan_status = 'Charged Off';

## LOAN STATUS

## 24) Loan Status Summary


SELECT
    loan_status,
    COUNT(id) AS LoanCount,
    SUM(total_payment) AS Total_Amount_Received,
    SUM(loan_amount) AS Total_Funded_Amount,
    AVG(int_rate * 100) AS Interest_Rate,
    AVG(dti * 100) AS DTI
FROM financial_loan
GROUP BY loan_status;


## 25) MTD Loan Status Summary (Month = 12)


SELECT 
    loan_status, 
    SUM(total_payment) AS MTD_Total_Amount_Received, 
    SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM financial_loan
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 12
GROUP BY loan_status;


## BANK LOAN REPORT | OVERVIEW

## 26) MONTH Overview (MySQL fixed)


SELECT 
    MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) AS Month_Number,
    MONTHNAME(STR_TO_DATE(issue_date, '%d-%m-%Y')) AS Month_Name,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY Month_Number, Month_Name
ORDER BY Month_Number;


## 27) STATE Overview

SELECT 
    address_state AS State, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY address_state
ORDER BY address_state;


## 28) TERM Overview

SELECT 
    term AS Term, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY term
ORDER BY term;


## 29) EMPLOYEE LENGTH Overview

SELECT 
    emp_length AS Employee_Length, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY emp_length
ORDER BY emp_length;

## 30) PURPOSE Overview

SELECT 
    purpose AS Purpose, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY purpose
ORDER BY purpose;


## 31) HOME OWNERSHIP Overview


SELECT 
    home_ownership AS Home_Ownership, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY home_ownership
ORDER BY home_ownership;
