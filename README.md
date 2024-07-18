# Telecom Customer Churn Analysis 


## Problem Statement

This analysis helps the telecom company understand their customers better, particularly their satisfaction with the services provided. The dataset includes columns with demographic and geographic information, details about referrals made by customers, and various services the customers have subscribed to, such as internet and streaming services etc . There are also columns related to payment and revenue, as well as a customer status column that indicates whether the customer has churned or is still with the company and to Identify the overall executive Summary and also the main objective of this data analysis project is to conduct an in-depth examination of Telecom Customer Churn analysis. The project aims to identify early indicators and patterns associated with customer churn. 

By deriving actionable insights from the data, the project seeks to provide valuable business operational and customer experience insights. 
The ultimate goal is to equip the telecom company with actionable findings that can guide targeted retention efforts, effectively reducing customer churn and contributing to overall business sustainability and growth.

### Project Golas

Create an entire ETL process in a database and a power bi dashboard to utilize the customer data and achive the below goals 

    1. Analyse Customer Data at below levels 
      a. Demographic
      b. Geographic 
      c. Payment and account info 
      d. Services 
    2. Study Churner profile and identify areas for implementing marketing campaings
    3. Identify a Method to predict future churners 

    Metrics Required 
    1. Total Customer
    2. Total churn and churn rate 
    3. New joiners    

### ETL Framework 
    Our framework uses below componenets:
    - CSV file - This is our source file 
    - SQL server management studio - we will use its inbuilt import wizard to transform and load data 
    - SQL server database - This is where our final data will be loaded and host our data warehouse , tables and views for final usage 

    Alternative framework    
    - CSV file - This is our source file 
    -  SQL Server integration services - we can use custome made ssis package to transform and load data.Thia is usually used when you have ecurring data loads and you want to automate the process
    - SQL server database - Packages loads our final data into the data warehouse in SQL server 


### SQL Queries 

#### Data Exploration to Check Distinct Values
    1.SELECT Gender, Count(Gender) as TotalCount,
    Count(Gender) * 100 / (Select Count(*) from stg_Churn)  as Percentage
    from stg_Churn
    Group by Gender

    2.SELECT Contract, Count(Contract) as TotalCount,
    Count(Contract) * 100 / (Select Count(*) from stg_Churn)  as Percentage
    from stg_Churn
    Group by Contract


    3.SELECT Customer_Status, Count(Customer_Status) as TotalCount, Sum(Total_Revenue) as TotalRev,
    Sum(Total_Revenue) / (Select sum(Total_Revenue) from stg_Churn) * 100  as RevPercentage
    from stg_Churn
    Group by Customer_Status

    4.SELECT State, Count(State) as TotalCount,
    Count(State) * 100 / (Select Count(*) from stg_Churn)  as Percentage
    from stg_Churn
    Group by State
    Order by Percentage desc


#### Data Exploration to Check Nulls
    SELECT 
    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Customer_ID_Null_Count,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Gender_Null_Count,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_Null_Count,
    SUM(CASE WHEN Married IS NULL THEN 1 ELSE 0 END) AS Married_Null_Count,
    SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS State_Null_Count,
    SUM(CASE WHEN Number_of_Referrals IS NULL THEN 1 ELSE 0 END) AS Number_of_Referrals_Null_Count,
    SUM(CASE WHEN Tenure_in_Months IS NULL THEN 1 ELSE 0 END) AS Tenure_in_Months_Null_Count,
    SUM(CASE WHEN Value_Deal IS NULL THEN 1 ELSE 0 END) AS Value_Deal_Null_Count,
    SUM(CASE WHEN Phone_Service IS NULL THEN 1 ELSE 0 END) AS Phone_Service_Null_Count,
    SUM(CASE WHEN Multiple_Lines IS NULL THEN 1 ELSE 0 END) AS Multiple_Lines_Null_Count,
    SUM(CASE WHEN Internet_Service IS NULL THEN 1 ELSE 0 END) AS Internet_Service_Null_Count,
    SUM(CASE WHEN Internet_Type IS NULL THEN 1 ELSE 0 END) AS Internet_Type_Null_Count,
    SUM(CASE WHEN Online_Security IS NULL THEN 1 ELSE 0 END) AS Online_Security_Null_Count,
    SUM(CASE WHEN Online_Backup IS NULL THEN 1 ELSE 0 END) AS Online_Backup_Null_Count,
    SUM(CASE WHEN Device_Protection_Plan IS NULL THEN 1 ELSE 0 END) AS Device_Protection_Plan_Null_Count,
    SUM(CASE WHEN Premium_Support IS NULL THEN 1 ELSE 0 END) AS Premium_Support_Null_Count,
    SUM(CASE WHEN Streaming_TV IS NULL THEN 1 ELSE 0 END) AS Streaming_TV_Null_Count,
    SUM(CASE WHEN Streaming_Movies IS NULL THEN 1 ELSE 0 END) AS Streaming_Movies_Null_Count,
    SUM(CASE WHEN Streaming_Music IS NULL THEN 1 ELSE 0 END) AS Streaming_Music_Null_Count,
    SUM(CASE WHEN Unlimited_Data IS NULL THEN 1 ELSE 0 END) AS Unlimited_Data_Null_Count,
    SUM(CASE WHEN Contract IS NULL THEN 1 ELSE 0 END) AS Contract_Null_Count,
    SUM(CASE WHEN Paperless_Billing IS NULL THEN 1 ELSE 0 END) AS Paperless_Billing_Null_Count,
    SUM(CASE WHEN Payment_Method IS NULL THEN 1 ELSE 0 END) AS Payment_Method_Null_Count,
    SUM(CASE WHEN Monthly_Charge IS NULL THEN 1 ELSE 0 END) AS Monthly_Charge_Null_Count,
    SUM(CASE WHEN Total_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Charges_Null_Count,
    SUM(CASE WHEN Total_Refunds IS NULL THEN 1 ELSE 0 END) AS Total_Refunds_Null_Count,
    SUM(CASE WHEN Total_Extra_Data_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Extra_Data_Charges_Null_Count,
    SUM(CASE WHEN Total_Long_Distance_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Long_Distance_Charges_Null_Count,
    SUM(CASE WHEN Total_Revenue IS NULL THEN 1 ELSE 0 END) AS Total_Revenue_Null_Count,
    SUM(CASE WHEN Customer_Status IS NULL THEN 1 ELSE 0 END) AS Customer_Status_Null_Count,
    SUM(CASE WHEN Churn_Category IS NULL THEN 1 ELSE 0 END) AS Churn_Category_Null_Count,
    SUM(CASE WHEN Churn_Reason IS NULL THEN 1 ELSE 0 END) AS Churn_Reason_Null_Count
    FROM stg_Churn;


#### Remove null and insert the new data into Prod table
    SELECT 
    Customer_ID,
    Gender,
    Age,
    Married,
    State,
    Number_of_Referrals,
    Tenure_in_Months,
    ISNULL(Value_Deal, 'None') AS Value_Deal,
    Phone_Service,
    ISNULL(Multiple_Lines, 'No') As Multiple_Lines,
    Internet_Service,
    ISNULL(Internet_Type, 'None') AS Internet_Type,
    ISNULL(Online_Security, 'No') AS Online_Security,
    ISNULL(Online_Backup, 'No') AS Online_Backup,
    ISNULL(Device_Protection_Plan, 'No') AS Device_Protection_Plan,
    ISNULL(Premium_Support, 'No') AS Premium_Support,
    ISNULL(Streaming_TV, 'No') AS Streaming_TV,
    ISNULL(Streaming_Movies, 'No') AS Streaming_Movies,
    ISNULL(Streaming_Music, 'No') AS Streaming_Music,
    ISNULL(Unlimited_Data, 'No') AS Unlimited_Data,
    Contract,
    Paperless_Billing,
    Payment_Method,
    Monthly_Charge,
    Total_Charges,
    Total_Refunds,
    Total_Extra_Data_Charges,
    Total_Long_Distance_Charges,
    Total_Revenue,
    Customer_Status,
    ISNULL(Churn_Category, 'Others') AS Churn_Category,
    ISNULL(Churn_Reason , 'Others') AS Churn_Reason

    INTO [db_Churn].[dbo].[prod_Churn]
    FROM [db_Churn].[dbo].[stg_Churn];


#### Create View for Power BI
    Create View vw_ChurnData as
	select * from prod_Churn where Customer_Status In ('Churned', 'Stayed')

    Create View vw_JoinData as
	select * from prod_Churn where Customer_Status = 'Joined'

### Power Query Transformations & Measures
#### Add a new column in prod_Churn
    1.Churn Status = if [Customer_Status] = "Churned" then 1 else 0
    2.Change Churn Status data type to numbers
    3.Monthly Charge Range = if [Monthly_Charge] < 20 then "< 20" else if [Monthly_Charge] < 50 then "20-50" else if [Monthly_Charge] < 100 then "50-100" else "> 100"

#### Create a New Table Reference for mapping_AgeGrp
    1.Keep only Age column and remove duplicates
    2.Age Group = if [Age] < 20 then "< 20" else if [Age] < 36 then "20 - 35" else if [Age] < 51 then "36 - 50" else "> 50"
    3.AgeGrpSorting = if [Age Group] = "< 20" then 1 else if [Age Group] = "20 - 35" then 2 else if [Age Group] = "36 - 50" then 3 else 4
    4.Change data type of AgeGrpSorting

#### Create a new table reference for mapping_TenureGrp
    1.Keep only Tenure_in_Months and remove duplicates
    2.Tenure Group = if [Tenure_in_Months] < 6 then "< 6 Months" else if [Tenure_in_Months] < 12 then "6-12 Months" else if [Tenure_in_Months] < 18 then "12-18 Months" else if [Tenure_in_Months] < 24 then "18-24 Months" else ">= 24 Months"
    3.TenureGrpSorting = if [Tenure_in_Months] = "< 6 Months" then 1 else if [Tenure_in_Months] =  "6-12 Months" then 2 else if [Tenure_in_Months] = "12-18 Months" then 3 else if [Tenure_in_Months] = "18-24 Months " then 4 else 5
    4.Change data type of TenureGrpSorting  

#### Create a new table reference for prod_Services
    1.Unpivot services columns
    2.Rename Column – 
    a.Attribute >> Services 
    b.Value >> Status

#### Summary Page - Measures

    Total Customers = Count(prod_Churn[Customer_ID])

    New Joiners = CALCULATE(COUNT(prod_Churn[Customer_ID]), prod_Churn[Customer_Status] = "Joined")

    Total Churn = SUM(prod_Churn[Churn Status]) 

    Churn Rate = [Total Churn] / [Total Customers]




# Snapshot of Data Model (contains facts and dimension table )
![Screenshot (4)](https://github.com/user-attachments/assets/2bc1c51a-36bb-48e2-8d33-b2955f41420c)


# Snapshot of churn analysis summary 
![Screenshot (9)](https://github.com/user-attachments/assets/dd974ba5-c0ab-4336-8bdb-678cdb358366)






# Snapshot of male customer summary 
![Screenshot (8)](https://github.com/user-attachments/assets/d8480083-bf0a-40ec-aa75-a2efed1ad2ca)

# Snaoshot of female customer summary 
![Screenshot (11)](https://github.com/user-attachments/assets/efea35b6-142d-4102-829b-486709e79ad8)









# Insights

A single page report was created on Power BI Desktop & it was then published to Power BI Service.

Following inferences can be drawn from the dashboard;

### [1] Total Number of Customers = 6418

   - Number of satisfied Customers (Male) = 2370 

   - Number of satisfied Customers (Female) = 4048

### [2] Total Number of churned Customers = 1732


   - Number of churned customers (Male) = 621

   - Number of churned customers (Female) = 1111

   
   ### [3] Total Number of New joined Customers = 411
   
- Number of New joined customers (Male) = 142
 - Number of New joined customers (Female) = 269
