select 
Customer_ID,
Gender,
Age,
Married,
State,
Number_of_Referrals,
Tenure_in_Months,
isnull(Value_Deal, 'none') as Value_Deal,
Phone_Service,
isnull (Multiple_Lines,'No') as Multiple_Lines,
Internet_Service,
isnull (Internet_Type,'No') as Internet_Type,
isnull (Online_Security,'No') as Online_Security,
isnull (Online_Backup,'No') as Online_Backup,
isnull (Device_Protection_Plan,'No') as Device_Protection_Plan,
isnull (Premium_Support,'No') as Premium_Support,
isnull (Streaming_TV,'No') as Streaming_TV,
isnull (Streaming_Movies,'No') as Streaming_Movies,
isnull (Streaming_Music,'No') as Streaming_Music,
isnull (Unlimited_Data,'No') as Unlimited_Data,
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
isnull (Churn_Category,'No') as Churn_Category,
isnull (Churn_Reason,'No') as Churn_Reason
into pro_churn
from stg_churn











