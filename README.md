# Olist E-commerce Performance Analysis: End-to-End BI Solution (SSIS, SQL Server, Power BI) 📊📈

This project demonstrates a comprehensive Business Intelligence solution, showcasing data integration using **SQL Server Integration Services (SSIS)**, data warehousing in **SQL Server**, and insightful visualization with **Power BI**. It focuses on analyzing the Olist e-commerce dataset to derive strategic business insights.

## 🖼️ Project Showcase: A Visual Overview

This section provides a quick visual tour of the project's key components: the SSIS ETL processes, the Data Warehouse schema, and the interactive Power BI dashboards.

### 1. SSIS - ETL Process Snapshots

Visualizing the backbone of our data pipeline:

*   **Overall SSIS Package Structure (Control Flow):**
    ![SSIS Control Flow Overview](screenshots/SSIS_1.png)

*   **SSIS Package During Execution (Progress/Success):**
    ![SSIS Package Execution](screenshots/SSIS_2.png)
    A package successfully completing its execution steps.

*   **Data Flow for Loading `FactOrders` (Remplissage):**
    ![SSIS Data Flow FactOrders](screenshots/SSIS_3.png)
    The data flow task responsible for populating the FactOrders table, showing sources, transformations, and destination.

*   **Data Flow for Loading `FactOrderItems` (Remplissage):**
    ![SSIS Data Flow FactOrderItems](screenshots/SSIS_4.png)
    The data flow task for populating FactOrderItems, highlighting lookups and data transformations.

### 2. Data Warehouse Schema (SQL Server)

The blueprint of our analytical data store:

*   **Entity Relationship Diagram (ERD):**
      ![Data Warehouse ERD](screenshots/Datawarehouse.png)
    Star/Hybrid schema illustrating the relationships between fact and dimension tables.

### 3. Power BI Dashboard Highlights

Bringing data to life with interactive visualizations:

*   **Main Strategic Overview Dashboard:**
    ![Dashboard Overview](screenshots/PB_1.png)
    High-level KPIs and overall business performance summary.

*   **Product Performance Analysis Dashboard:**
    ![Dashboard Product Analysis](screenshots/PB_2.png)
    Insights into top-selling products, categories, and revenue trends.

*   **Market / Geographical Insights Dashboard:**
    ![Dashboard Market Analysis](screenshots/PB_3.png)
    Sales distribution by state, and regional performance.

*   **Customer Review & Sentiment Dashboard:**
    ![Dashboard Review Analysis](screenshots/PB_4.png)
    Analysis of customer satisfaction, review score distributions, and trends.
---

## 🌟 Project Overview

The core objective of this project was to:
1.  **Integrate** data from disparate sources (multiple CSV files and other database sources) using robust SSIS packages.
2.  **Design and Build** a snowflake Schema data warehouse in SQL Server to consolidate and structure this data for efficient analytical querying.
3.  **Develop** interactive dashboards in Power BI to visualize key performance indicators (KPIs) and trends related to sales, products, market performance, and customer reviews.
4.  **Enable** data-driven decision-making by providing actionable insights from the Olist e-commerce operations.

## 🚀 Key Features

*   **Data Integration with SSIS:** Sophisticated ETL processes developed using SQL Server Integration Services to extract, transform, and load data from source systems into the data warehouse.
*   **SQL Server Data Warehousing:** Implements a snowflake Schema with fact tables (e.g., `FactOrders`, `FactOrderItems`) and dimension tables (e.g., `DimCustomer`, `DimProduct`, `DimDate`, `DimSeller`) in a SQL Server database.
*   **Interactive Visualizations (Power BI):** Rich dashboards providing insights into:
    *   Overall Strategic Performance
    *   In-depth Product Analysis
    *   Market Analysis (by state/region)
    *   Customer Review Sentiment and Trends
*   **Key Metrics Tracked:** Revenue, Order Volume, Average Order Value, Customer Satisfaction, Sales Trends, Top Performing Products/Categories/Markets, Shipping Costs, etc.

## 🛠️ Technologies Used

*   **Data Sources:** CSV files, Sql server Database
*   **ETL Tool:** **SQL Server Integration Services (SSIS)**
*   **Data Warehouse Database:** **Microsoft SQL Server**
*   **Data Visualization:** **Microsoft Power BI**
*   **Development Environment:** SQL Server Management Studio (SSMS), Visual Studio (for SSIS)
*   **Version Control:** Git & GitHub

1.  **Prerequisites:**
    *   Microsoft SQL Server (Developer or Express edition is fine for local setup).
    *   SQL Server Management Studio (SSMS).
    *   SQL Server Data Tools (SSDT) for Visual Studio (to open and run SSIS packages).
    *   Power BI Desktop.

 2.  **Data Sources:**
    *   The Olist dataset is publicly available. Download it from [https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce]. it is also available in the `data/` directory.
    ![Database schema](screenshots/Database.png)
    *   Update file paths within SSIS packages (e.g., in Flat File Connection Managers) to point to the location of your CSV files if they differ from the project structure.

3.  **Database Setup (Data Warehouse):**
    *   Using SSMS, connect to your SQL Server instance.
    *   Create a new database (e.g., `olist_dw`).
    *   Run the SQL scripts located in `sql_scripts/`to create the necessary tables in the `olist_dw` database.

4. **Power BI:**
    *   Open the `Olist_Performance_Dashboard.pbix` file in Power BI Desktop.
    *   Update the data source connection to point to your local `olist_dw` SQL Server database. Go to `Transform data` -> `Data source settings`.

## 🚀 Future Improvements

*   Automate SSIS package execution using SQL Server Agent.
*   Expand the data warehouse with more subject areas.
*   Integrate sentiment analysis on review text data.

## 🙏 Acknowledgements
*   Olist for providing the public e-commerce dataset.

## 📧 Contact

EL RHERBI MOHAMED AMINE - https://www.linkedin.com/in/mohamed-amine-el-rherbi-3137a3217/ 

  
