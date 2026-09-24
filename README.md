# Healthcare-Hospital-Analytics
Healthcare Patient &amp; Hospital Operations Analytics project using SQL and Power BI to analyze patient demographics, hospital admissions, diagnoses, departments, length of stay, readmissions, and appointment patterns through an interactive healthcare analytics dashboard.

## PROJECT OVERVIEW


The **Healthcare Patient & Hospital Operations Analytics** project focuses on analyzing synthetic healthcare data to understand patient demographics, hospital admissions, diagnoses, departmental activity, length of stay, readmissions, and appointment patterns.

The project uses **SQL and Power BI** to transform raw healthcare data into meaningful analytical insights through data exploration, relational data modeling, calculations, and interactive visualizations. The Power BI dashboard provides an overview of hospital operations and allows key metrics and patterns to be examined across patients, departments, diagnoses, admissions, and appointments.

The dataset consists of multiple interconnected tables representing patients, hospital departments, admissions, appointments, and treatments. Relationships between these tables were established to enable cross-table analysis and create a unified view of hospital operations.

The primary objective of this project is to demonstrate how healthcare data can be organized, analyzed, and visualized to support data-driven understanding of hospital operations. The project also demonstrates practical skills in **SQL querying, data modeling, Power BI dashboard development, KPI creation, and analytical storytelling**.

The final project will include the underlying datasets, SQL analysis, Power BI dashboard, key analytical insights, and supporting documentation.

## BUSINESS PROBLEM

Healthcare organizations generate large volumes of data related to patients, hospital admissions, diagnoses, departments, treatments, and appointments. When this information is stored across multiple datasets, it can be difficult to obtain a clear view of hospital operations and identify important patterns.

This project addresses the need to analyze healthcare operational data in a structured and visual manner. The analysis focuses on understanding:

* Patient demographics and distribution
* Hospital admission patterns across departments and diagnoses
* Average length of hospital stay
* Readmission patterns and readmission rates
* Appointment completion, cancellation, rescheduling, and no-show patterns
* Department-level variations in hospital activity

The goal is to transform raw healthcare data into meaningful metrics and interactive visualizations that can help stakeholders better understand hospital operations and identify areas that may require further investigation.

Using **SQL for data analysis and Power BI for data modeling, KPI development, and visualization**, this project demonstrates how healthcare operational data can be converted into an accessible analytical dashboard for data-driven decision-making.

## PROJECT OBJECTIVES

The main objectives of this project are to:

* Analyze patient demographics and understand the distribution of patients across different categories.
* Examine hospital admission patterns across departments and diagnoses.
* Calculate and monitor key hospital performance indicators such as total admissions, average length of stay, readmissions, and readmission rate.
* Analyze appointment outcomes, including completed, cancelled, rescheduled, and no-show appointments.
* Identify department-level variations in admissions, readmissions, and average length of stay.
* Use SQL to query, aggregate, and analyze healthcare data across multiple related tables.
* Build an interactive Power BI dashboard to present key healthcare operational metrics and trends.
* Translate the analyzed data into meaningful insights that can support better understanding of hospital operations.

  ## DATASET AND DATA MODELS

The project uses a synthetic healthcare dataset consisting of five interconnected tables representing patients and hospital operations.

### Tables

| Table          | Description                                                                                                                        |
| -------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `patients`     | Contains patient-level information such as patient ID, age, and gender.                                                            |
| `departments`  | Contains hospital department information and department identifiers.                                                               |
| `admissions`   | Contains hospital admission records, including admission date, diagnosis, department, length of stay, and readmission information. |
| `appointments` | Contains patient appointment records and appointment status such as completed, cancelled, rescheduled, and no-show.                |
| `treatments`   | Contains treatment-related information associated with hospital records.                                                           |

### Data Relationships

The tables were connected using primary and foreign key relationships to create a relational data model in Power BI.

The main relationships include:

* `patients[patient_id]` → `admissions[patient_id]`
* `patients[patient_id]` → `appointments[patient_id]`

Both relationships use **one-to-many cardinality**, where one patient can have multiple admission and appointment records.

The data model allows patient-level information to be analyzed together with hospital admission and appointment data, enabling cross-table analysis and interactive filtering in Power BI.

## Tools & Technologies

| Tool / Technology              | Purpose                                                                              |
| ------------------------------ | ------------------------------------------------------------------------------------ |
| **SQL**                        | Data querying, filtering, aggregation, grouping, and healthcare data analysis        |
| **Power BI**                   | Data modeling, DAX calculations, KPI development, and interactive dashboard creation |
| **Microsoft Excel**            | Initial data exploration, validation, and supporting analysis                        |
| **Python**                     | Synthetic healthcare dataset generation and data preparation                         |
| **Jupyter Notebook / VS Code** | Python-based dataset generation and development environment                          |
| **GitHub**                     | Project documentation, version control, and portfolio presentation                   |

## Data Analysis with SQL

SQL was used to explore, filter, aggregate, and analyze the healthcare dataset before building the Power BI dashboard.

The analysis included:

* Examining patient demographics and gender distribution.
* Counting hospital admissions across different diagnoses.
* Analyzing admission patterns by department.
* Calculating and validating key hospital metrics.
* Examining readmission records and readmission rates.
* Analyzing appointment records and appointment status distribution.
* Using aggregate functions such as `COUNT()`, `SUM()`, and `AVG()` to derive healthcare metrics.
* Using `GROUP BY`, `WHERE`, `HAVING`, `ORDER BY`, and `DISTINCT` to organize and analyze the data.
* Using primary key and foreign key relationships to understand connections between related healthcare tables.

### Example SQL Analysis

The following query was used to identify the number of admissions for each diagnosis:

```sql
SELECT
    diagnosis,
    COUNT(admission_id) AS admission_count
FROM admissions
GROUP BY diagnosis
ORDER BY admission_count DESC;
```

This analysis was used to validate the admission patterns later visualized in Power BI.

SQL results were cross-checked with Power BI calculations to maintain consistency between the underlying data analysis and the final dashboard.


## Key Insights

### 1. General Medicine has the highest admission volume

General Medicine recorded **1,621 admissions**, the highest among all departments, followed by Gynaecology (**1,008**) and Cardiology (**966**). This indicates that General Medicine handles a comparatively higher volume of hospital admissions in the dataset.

### 2. General Medicine records the highest number of readmissions

General Medicine recorded **190 readmissions**, followed by Orthopaedics (**132**) and Gynaecology (**122**). Since General Medicine also has the highest admission volume, its readmission count represents an important operational metric to monitor.

### 3. Average length of stay varies considerably across departments

The overall average length of stay is **3.54 days**, while department-level averages range from **1.4 days** in ENT and Dermatology to **5.9 days** in Oncology. This shows substantial variation in hospital stay duration across departments.

### 4. Fever and hypertension are the most frequently recorded diagnoses

**Fever (814 admissions)** and **Hypertension (677 admissions)** are the two most frequently recorded diagnoses, followed by Diabetes (427), Respiratory Infection (379), Infection (375), and Asthma (371). This highlights the concentration of admissions among the most common diagnoses in the dataset.

### 5. The overall readmission rate is 12.4%

The dataset contains **10,000 admissions**, including **1,240 readmissions**, resulting in an overall readmission rate of **12.4%**. This makes readmission an important metric for evaluating hospital operational patterns.

### 6. Most appointments are completed, but a significant share are not completed as scheduled

**71.61%** of appointments were completed, while **10.20% were cancelled**, **10.09% were rescheduled**, and **8.09% were no-shows**. Overall, **28.38%** of appointments did not result in a completed appointment.

### 7. Monthly admission volume shows a substantial decline after August

Admissions remained relatively high during the first eight months and reached approximately **1,000 admissions in August**, followed by a sharp decline to around **620 admissions in September**. The volume remained comparatively lower through December. This pattern would require further investigation in a real-world hospital dataset.

### 8. The patient population has a relatively balanced gender distribution

Of the **5,000 patients**, **2,638 (52.76%) are male** and **2,362 (47.24%) are female**. The distribution is relatively balanced, with a slightly higher proportion of male patients.

## Power BI Dashboard

Power BI was used to transform the analyzed healthcare data into an interactive dashboard for monitoring patient and hospital operational metrics.

### Key Performance Indicators (KPIs)

The dashboard includes the following key metrics:

* **Total Patients:** 5,000
* **Total Admissions:** 10,000
* **Average Length of Stay:** 3.54 days
* **Total Readmissions:** 1,240
* **Readmission Rate:** 12.4%
* **Average Admissions per Patient:** 2.00

### Dashboard Visualizations

The dashboard includes multiple visualizations covering different aspects of healthcare operations:

1. **Admissions by Diagnosis** — Displays the distribution of hospital admissions across different diagnoses.
2. **Patient Distribution by Gender** — Shows the gender distribution of the patient population.
3. **Monthly Admissions Trend** — Visualizes admission patterns over time.
4. **Average Length of Stay by Department** — Compares average hospital stay across departments.
5. **Readmissions by Department** — Shows the number of readmissions across departments.
6. **Appointment Status Distribution** — Displays completed, cancelled, rescheduled, and no-show appointments.
7. **Admissions by Department** — Compares admission volume across hospital departments.
8. **Admissions by Department and Diagnosis** — A matrix showing the relationship between departments and diagnoses.
9. **Average Admissions per Patient** — Shows the average number of admissions per patient.

### Data Modeling

A relational data model was created in Power BI to connect the healthcare tables.

The primary patient-level relationships include:

* `patients[patient_id]` → `admissions[patient_id]`
* `patients[patient_id]` → `appointments[patient_id]`

Both relationships use **one-to-many cardinality** with single-direction filtering.

DAX measures were created to calculate important metrics such as average length of stay, total readmissions, readmission rate, and average admissions per patient.

The dashboard provides an interactive view of hospital operations and enables users to examine healthcare metrics across different departments, diagnoses, patients, and appointment outcomes.


## Project Conclusion

The **Healthcare Patient & Hospital Operations Analytics** project demonstrates how healthcare operational data can be transformed into meaningful analytical insights using **SQL and Power BI**.

The analysis covered patient demographics, hospital admissions, diagnoses, departmental activity, average length of stay, readmissions, and appointment outcomes. SQL was used to explore and validate the underlying healthcare data, while Power BI was used for data modeling, KPI development, interactive visualizations, and dashboard creation.

The final dashboard provides a consolidated view of key hospital operational metrics and highlights variations in admission volumes, department activity, length of stay, readmissions, diagnoses, and appointment outcomes.

Through this project, I developed practical experience in **SQL querying, relational data analysis, Power BI data modeling, DAX measures, dashboard development, KPI analysis, and data storytelling** within a healthcare domain.

The project demonstrates the process of converting raw healthcare data into structured analysis and communicating the resulting patterns through an interactive business intelligence dashboard.







