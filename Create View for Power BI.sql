create view vw_ChurnData as 
 select * from pro_churn where customer_status in ('Churned' , 'Stayed')

 create view vw_JoinData as 
 select * from pro_churn where customer_status = 'Joined'