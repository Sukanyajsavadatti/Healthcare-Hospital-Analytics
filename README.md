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






