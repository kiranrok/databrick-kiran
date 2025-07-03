-- s3://jpmctraining/pipeline_input/sales
-- pipeline ( Streaming table , materialized view, view)
--ETL pipeline

create streaming table sales_pl as
SELECT *, current_date() as ingestion_date FROM stream read_files(
    's3://jpmctraining/pipeline_input/sales',
    format => 'csv');

create streaming table products_pl as
SELECT *, current_date() as ingestion_date FROM stream read_files(
    's3://jpmctraining/pipeline_input/products',
    format => 'csv');

create streaming table customers_pl as
SELECT *, current_date() as ingestion_date FROM stream read_files(
    's3://jpmctraining/pipeline_input/customers',
    format => 'csv');
