-- Create and populate the product silver table.
CREATE OR REFRESH STREAMING TABLE naval_silver.customers_scd2;

CREATE FLOW customerflow AS AUTO CDC INTO
  naval_silver.customers_scd2
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