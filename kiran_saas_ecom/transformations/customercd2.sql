-- Create and populate the product silver table.
CREATE OR REFRESH STREAMING TABLE kiran_silver.customers_scd2;

CREATE FLOW customerflow AS AUTO CDC INTO
  kiran_silver.customers_scd2
FROM
  stream(customers_pl)
KEYS
  (customer_id)
APPLY AS DELETE WHEN
  operation = "DELETE"
SEQUENCE BY
  sequenceNum
COLUMNS * EXCEPT
  (operation, sequenceNum,_rescued_data, ingestion_date)
STORED AS
  SCD TYPE 2;

create materialized view kiran_gold.customer_active as 
select * from kiran_silver.customers_scd2 where `__END_AT` is NULL;


create materialized view kiran_gold.top_customers as
select
  s.customer_id,
  c.customer_name,
  c.customer_email,
  c.customer_city,
  sum(s.total_amount) as total_sales
from kiran_silver.sales_cleaned_pl s
join kiran_gold.customer_active c
  on s.customer_id = c.customer_id
group by all
order by total_sales desc
limit 3;