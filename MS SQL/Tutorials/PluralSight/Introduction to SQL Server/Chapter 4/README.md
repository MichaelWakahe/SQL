# Introduction to T-SQL

The default schemas are `sys` and `dbo`. They can contain tables, views etc.
SQL Server Metadata is in `sys.tables`, `sys.columns` and `sys.types`.

Functions can be classified into:

* Scalar e.g. SELECT EOMONTH('07/07/2022')
* Table valued e.g. SELECT * FROM dbo.BDayToday()
* Aggregate e.g. SELECT COUNT(*) FRO

There are built-in functions as well as user defined functions.

Other supported features are: Stored Procedures, Views

## Notebook

Open `demos.ipynb` using Azure Data Studio.
