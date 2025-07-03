--sales silver
create streaming table kiran_silver.sales_cleaned_pl 
(constraint valid_order_id EXPECT (order_id is not null) on violation drop row)
as 
select distinct * from stream sales_pl;

-- Create and populate the product silver table.
CREATE OR REFRESH STREAMING TABLE kiran_silver.product1_cleaned;

CREATE FLOW produtflow AS AUTO CDC INTO
  kiran_silver.product1_cleaned
FROM
  stream(products_pl)
KEYS
  (product_id)
APPLY AS DELETE WHEN
  operation = "DELETE"
SEQUENCE BY
  seqNum
COLUMNS * EXCEPT
  (operation, seqNum,_rescued_data, ingestion_date)
STORED AS
  SCD TYPE 1;