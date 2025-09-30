
# Azure Retail Data Engineering Project

This project demonstrates how raw retail data can be ingested, transformed, and delivered for Business Intelligence (BI) purposes using a modern **Medallion Architecture (Bronze → Silver → Gold)** on Azure.  

The pipeline processes the **AdventureWorks dataset**.
<img width="1344" height="768" alt="azure-de-pr-architecture" src="https://github.com/user-attachments/assets/f4c2be1f-4562-41f0-aca4-44986a00e35e" />


## Architecture Overview
### Step 1: Setting Up the Azure Environment ⚙️

The following Azure resources were provisioned to build the data engineering pipeline:

- **Azure Data Factory (ADF)** for orchestration and data ingestion  
- **Azure Databricks** with PySpark for scalable transformations and Delta Lake storage  
- **Azure Storage Account** acts as the data lake, storing raw (bronze), transformed (silver), and curated (gold) data. 
- **Azure Synapse Analytics** serves as the data warehouse layer, enabling efficient querying and BI integration  

All resources were configured with proper Identity and Access Management (IAM) roles to ensure seamless integration and security.
<img width="1920" height="920" alt="Screenshot (2)" src="https://github.com/user-attachments/assets/67908c99-419a-4632-9b92-bba50b5e162e" />


### Step 2: Implementing the Data Pipeline Using ADF 🚀  
**Azure Data Factory (ADF)** acts as the backbone for orchestrating the end-to-end data pipeline.  
- **Dynamic Copy Activity** → Data is ingested from GitHub (AdventureWorks dataset) using an HTTP connector and stored in the **Bronze layer** of Azure Data Lake.  
- **Parameterization** → Pipeline parameters were introduced to make ingestion **dynamic, reusable, and adaptable** to future changes in data sources.  
<img width="1920" height="922" alt="Screenshot (3)" src="https://github.com/user-attachments/assets/b92e9bb3-c623-4f99-a0a4-6484a77c7bbb" />

The raw data is now securely stored and ready for transformation.
<img width="1920" height="920" alt="Screenshot (4)" src="https://github.com/user-attachments/assets/96346ba9-a3b8-44c1-bb84-4b5657d1b594" />


### Step 3: Data Transformation with Azure Databricks 🔄
**Azure Databricks** was used to process and transform raw data from the **Bronze layer** into clean, structured data stored in the **Silver layer**.  

#### Key Steps  
- **Cluster Setup** → A scalable Databricks cluster was provisioned to efficiently handle transformations on large datasets.  
- **Data Lake Integration** → Secure integration with Azure Data Lake ensured seamless access to raw data.
  <img width="1920" height="920" alt="Screenshot (5)" src="https://github.com/user-attachments/assets/9af31c52-c775-4df3-84c6-dbc071b966e7" />

- **Transformations Applied**:  
   - Normalized and standardized **date formats** for consistency.  
   - Cleaned and filtered out invalid, duplicate, or incomplete records.  
   - Applied **business rules** to group, join, and enrich data for usability.  
   - Stored outputs in **Parquet/Delta format** for optimized storage, compression, and query performance.
     <img width="1920" height="1080" alt="Screenshot (7)" src="https://github.com/user-attachments/assets/b63720d8-a520-4868-9144-ebb11d29ea62" />
  
- **Medallion Progression** → Data was promoted from **Bronze (raw)** to **Silver (clean/validated)**, making it analytics-ready for further aggregation in the Gold layer.
  <img width="1920" height="1080" alt="Screenshot (8)" src="https://github.com/user-attachments/assets/cc83308a-1f62-4159-bafd-1352c9480e71" />


### Step 4: Data Warehousing with Azure Synapse Analytics 📊
**Azure Synapse Analytics** was used to organize and serve the transformed data, enabling efficient analysis and seamless integration with BI tools.  
#### Key Steps  
- **Connection to Silver Layer** → Configured Synapse to query cleansed data directly from the Silver container in Azure Data Lake.  
- **Serverless SQL Pools** → Leveraged serverless querying for **cost-effective, on-demand analytics** without the need for upfront resource provisioning.  
- **Database & Schema Setup** → Created databases, schemas, and security configurations to organize datasets and enforce structured access control.  
- **External Tables & Views** → Defined external tables and BI-friendly views to expose curated data models for reporting.
  <img width="1920" height="1080" alt="Screenshot (9)" src="https://github.com/user-attachments/assets/b012819f-ac0b-4607-8315-44a2f885485e" />
  <img width="1920" height="1080" alt="Screenshot (10)" src="https://github.com/user-attachments/assets/758ca8f4-7f4d-42b9-b99f-ba929493efc7" />


- **Promotion to Gold Layer** → Curated, aggregated data was written into the **Gold container**, making it **business-ready** for dashboards and advanced analytics.
 <img width="1920" height="1080" alt="Screenshot (13)" src="https://github.com/user-attachments/assets/272232ba-1e5d-46a1-87c9-2c0f3f30e2da" />



### Step 5: Business Intelligence Integration 🕵️‍♂️
The final step was to make the curated data from the **Gold layer** accessible to business users through **Power BI** for reporting and insights.  
#### Power BI Integration  
- Connected **Power BI** to **Azure Synapse Analytics** for seamless access to curated Gold-layer data.  
- Designed **dashboards and reports** to present actionable insights to stakeholders.
  <img width="1920" height="975" alt="Screenshot (15)" src="https://github.com/user-attachments/assets/ee9a97ac-aed5-4c34-b49f-2b64845933e1" />



## Key Takeaways 🌐  

This project demonstrates how Azure’s ecosystem can be leveraged to build a **production-grade, Medallion Architecture–based data engineering pipeline**. By integrating services such as ADF, Databricks, Synapse Analytics, and Power BI, the solution showcases:  

- **Automation** → Orchestrated, parameterized pipelines that seamlessly move data through Bronze → Silver → Gold layers.  
- **Scalability** → Cloud-native design capable of handling large and evolving datasets.  
- **Efficiency** → Optimized storage and querying using **Delta/Parquet formats** and **serverless SQL pools**.  
- **Data Quality** → Validated, cleaned, and structured data ensuring trustworthiness for analytics.  
- **Actionable Insights** → Interactive Power BI dashboards that enable stakeholders to monitor KPIs and make data-driven decisions.  

This end-to-end solution highlights my ability to design and implement **modern cloud data platforms** that transform raw data into **business-ready insights**, reflecting real-world data engineering best practices.  

