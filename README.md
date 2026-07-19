# Global-Super-Store-Performance-Analysis

## 📊 Project Overview
This project is an end-to-end data analytics solution designed to transform raw data into actionable business insights. It demonstrates the complete data lifecycle, from ETL and database modeling to advanced visualization.

## 🛠 Tech Stack
* Data Cleaning & ETL: Advanced Excel, Power Query.
* Database Management: SQL Server (Relational Modeling, Views, Complex Joins).
* Data Visualization: Power BI (DAX, Star Schema Modeling, Interactive Dashboards).

## 💡 Key Business Insights
* Product Performance: Identified high-profit "star" products vs. underperforming items using scatter analysis.
* Customer Segmentation: Gained deep insights into customer behavior across different segments (Consumer, Corporate, Home Office).
* Sales Trends: Uncovered seasonal patterns and trend fluctuations to support better inventory planning and strategic forecasting.

## 🛠 Technical Challenge & Solution

Challenge: During the data modeling phase, I encountered a data integrity issue while mapping the Geography dimension to the Fact_Sales table using PostalCode.
* The Problem: The PostalCode field contained many nulls, which caused the dashboard to filter out non-US data, significantly limiting global reporting.
* The Solution: I resolved this by re-engineering the SQL view. I replaced PostalCode with City as the primary join key in the Fact_Sales view. I then refactored the dependent SQL queries to ensure consistency across the star schema. This ensured full data coverage while maintaining the integrity of the dimensional model.

## 📷 Dashboard Preview

Executive Summary:
<img width="1920" height="1003" alt="Executive Summary" src="https://github.com/user-attachments/assets/66629cf9-f106-49f3-8823-8a7ce6be00a0" />

Sales Analysis:
<img width="1920" height="1003" alt="Sales Analysis" src="https://github.com/user-attachments/assets/35abf022-e3d7-45a0-b889-c6899db64b62" />

Customer Insights:
<img width="1920" height="1000" alt="Customer Insights" src="https://github.com/user-attachments/assets/8990e45c-68f7-40ed-8240-859b082d5c45" />
