# Bank Loan Analysis Dashboard (Power BI + SQL + Python)

<img width="1753" height="927" alt="image" src="https://github.com/user-attachments/assets/c5dad10a-f6fc-4f89-b1e2-1c5245b8382f" />


This project is a complete **Bank Loan Data Analysis and Reporting solution** built using **MySQL, Python, and Power BI**.  
The goal is to analyze loan application trends, funded amounts, repayments, borrower risk indicators, and overall loan portfolio performance through interactive dashboards and KPI reporting.

The project includes:
- SQL scripts for database/table creation and analysis queries
- Python notebook for data exploration and validation
- Power BI dashboard with KPIs, trends, and detailed reporting views

---

## 📌 Business Problem

Banks need a reliable way to track and monitor loan performance to make data-driven decisions.  
This project helps answer key business questions such as:

- How many loan applications are received (MTD / MoM)?
- What is the total funded loan amount and how does it change over time?
- How much amount has been received back from borrowers?
- What is the average interest rate and borrower DTI?
- What percentage of loans are **Good Loans vs Bad Loans**?
- Which states, purposes, and borrower profiles drive the most loan activity?

(Reference: project problem statement and KPI requirements) :contentReference[oaicite:0]{index=0}

---

## 📊 Dashboard KPIs & Reports

### **Dashboard 1: Summary**
Key KPIs:
- Total Loan Applications (MTD / MoM)
- Total Funded Amount (MTD / MoM)
- Total Amount Received (MTD / MoM)
- Average Interest Rate (MTD / MoM)
- Average Debt-to-Income Ratio (DTI) (MTD / MoM)

Good Loan vs Bad Loan KPIs:
- Good Loan % and count
- Good Loan funded amount & total received amount
- Bad Loan % and count
- Bad Loan funded amount & total received amount

Loan Status Grid View:
- Total applications
- Funded amount
- Amount received
- Avg interest rate
- Avg DTI
- MTD metrics by loan status :contentReference[oaicite:1]{index=1}

---

### **Dashboard 2: Overview**
Visual insights:
- Monthly Trends by Issue Date (Line Chart)
- Regional Analysis by State (Filled Map)
- Loan Term Analysis (Donut Chart)
- Employee Length Analysis (Bar Chart)
- Loan Purpose Breakdown (Bar Chart)
- Home Ownership Analysis (Tree Map) :contentReference[oaicite:2]{index=2}

---

### **Dashboard 3: Details**
A detailed grid-style report that provides a consolidated view of loan-level information for deeper portfolio exploration and filtering. :contentReference[oaicite:3]{index=3}

---

## 🧾 Dataset Information

The dataset contains loan application and borrower-level fields such as:
- Loan ID, Loan Amount, Term, Interest Rate, Installment
- Loan Status, Issue Date, Payment Dates
- DTI, Annual Income, Verification Status
- Address State, Employee Length, Employee Title
- Purpose, Home Ownership, Grade/Sub Grade

Field definitions and business meaning are documented in the project documentation. :contentReference[oaicite:4]{index=4}

---

## 🛠 Tools & Technologies Used

- **MySQL** (Database creation + SQL queries)
- **Power BI** (Dashboard creation + DAX + Power Query)
- **Python (Jupyter Notebook)** (Exploration / validation)
- **Excel / CSV** (Dataset format)

---

## 📌 Key Insights Expected

This dashboard helps identify:
- Monthly lending trends and seasonality
- High-performing vs risky loan segments (Good vs Bad loans)
- Geographic hotspots for loan applications
- Borrower risk indicators such as DTI, income, verification status
- Loan performance by purpose, term, employment length, and home ownership

