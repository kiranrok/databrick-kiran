create materialized view kiran_gold.top_product_by_active_customer as
select
  c.customer_id,
  c.customer_name,
  p.product_id,
  p.product_name,
  p.product_category,
  sum(s.total_amount) as total_sales,
  count(distinct s.order_id) as order_count
from kiran_gold.customer_active c
join kiran_silver.sales_cleaned_pl s
  on c.customer_id = s.customer_id
join kiran_silver.product_cleaned p
  on s.product_id = p.product_id
group by all
order by total_sales desc
limit 10;