with
dates as (
              SELECT * FROM  UNNEST(GENERATE_DATE_ARRAY('2022-01-01',date_add(CURRENT_DATE(),interval 31 day), INTERVAL 1 DAY)) AS date
              ),
daily_sale_days as (select *,date_trunc(date,month) as month from dates where FORMAT_DATE('%A',date) <> 'Sunday' order by 1) 
select month,
count(distinct date) as sales_days 
from daily_sale_days
group by month
