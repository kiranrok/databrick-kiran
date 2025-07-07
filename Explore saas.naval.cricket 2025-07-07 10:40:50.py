# Databricks notebook source
# MAGIC %sql
# MAGIC SELECT * FROM `saas`.`naval`.`cricket`;

# COMMAND ----------

# MAGIC
# MAGIC %sql
# MAGIC INSERT INTO `saas`.`naval`.`cricket` (no, user_name, role, id, name)
# MAGIC VALUES (12, 'Shreyas', 'Batsman', 9, 'Iyer');
# MAGIC  
