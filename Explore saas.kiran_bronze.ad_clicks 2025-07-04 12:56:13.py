# Databricks notebook source
# MAGIC %sql
# MAGIC SELECT * FROM `saas`.`kiran_bronze`.`ad_clicks`;

# COMMAND ----------

# MAGIC %sql
# MAGIC update saas.kiran_bronze.ad_clicks 
# MAGIC set ad_cost_usd = 5 where click_id = 'CL001'
