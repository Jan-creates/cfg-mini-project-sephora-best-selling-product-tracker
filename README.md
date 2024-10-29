# cfg-mini-project-sephora-best-selling-product-tracker

This project was based on the skills I have learnt on the Data & SQL 8-week beginners course by CodeFristGirls (Sponsored by Aviva). 

# Project Objectives

Individual project that requires to fufill all core requirements and at least 2 advanced requirements. 

Project core requirements:

❎ Create relational DB with minimum 5 tables

❎ Set Primary and Foreign Key constraints to create relations between the tables

❎ Using any type of joins, create a view that combines multiple tables in a logical way

❎ In the DB, create a stored function that can be applied to a query in the DB

❎ Prepare an example query with a subquery to demonstrate how to extract data from the DB for analysis

❎ Create DB diagram where all table relations are shown

Project advanced requirements (include 2-3 minimum):
❎ In the DB, create a stored procedure and demonstrate how it runs

❎ In the DB, create a trigger and demonstrate how it runs

❎ In the DB, create an event and demonstrate how it runs

❎ Create a view that uses at least 3-4 base tables; prepare and demonstrate a query that uses the view to produce a logically arranged result set for analysis

❎ Prepare an example query with group by and having to demonstrate how to extract data from the DB for analysis

Present a 3 minute presentation to the group explaining the idea behind the DB (use DB diagram), what it is for and how it is expected to be used. Run sample queries to demonstrate how the functions, stored procedures etc work. Show snippets of data stored in the tables.

# Database: Sephora Best Selling Product Tracker

- The database consists of six core tables: Brands, Categories, Suppliers, Products, Sales, and a view for Monthly Revenue per Product.
- The Products table holds details about each product, such as price, stock, and its foreign key relationships to Brands, Categories, and Suppliers.
- Sales captures transaction details for each product, linking sales data back to the Products table.

Schema: This picture shows the relationships between the tables

![DIAGRAM - SephoraBestSellers](https://github.com/user-attachments/assets/31d0599a-2eb7-498e-8a4c-d22fa9c268da)

# Stored Procedure - Retrieve Sales by Date Range

  
