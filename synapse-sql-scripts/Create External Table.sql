-- CREATE CREDENTIALS --

CREATE MASTER KEY ENCRYPTION  BY PASSWORD = 'Udit@1234'

 CREATE DATABASE SCOPED CREDENTIAL cred_udit
 WITH
    IDENTITY = 'Managed Identity'

-- CREATE EXTERNAL DATA SOURCE - ONE FOR SILVER LAYER AND ONE FOR GOLD LAYER --

CREATE EXTERNAL DATA SOURCE source_silver
WITH
(
    LOCATION = 'https://datalakestoargeaccount.blob.core.windows.net/silver',
    CREDENTIAL = cred_udit
)


CREATE EXTERNAL DATA SOURCE source_gold
WITH
(
    LOCATION = 'https://datalakestoargeaccount.blob.core.windows.net/gold',
    CREDENTIAL = cred_udit
)

-- CREATE EXTERNAL FILE FORMAT -- 

CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)


-- CETAS : CREATE EXTERNAL TABLE extSales --
-- CETAS command moves the data from view on top of silver layer into external tables in gold layer --

CREATE EXTERNAL TABLE gold.extsales
WITH(
    LOCATION = 'extsales',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.sales



CREATE EXTERNAL TABLE gold.extterritories
WITH(
    LOCATION = 'extterritories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.territories


CREATE EXTERNAL TABLE gold.extreturns
WITH(
    LOCATION = 'extreturns',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.returns


CREATE EXTERNAL TABLE gold.extsubcat
WITH(
    LOCATION = 'extsubcat',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.subcat


CREATE EXTERNAL TABLE gold.extproducts
WITH(
    LOCATION = 'extproducts',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.products


CREATE EXTERNAL TABLE gold.extcustomers
WITH(
    LOCATION = 'extcustomers',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.customers


CREATE EXTERNAL TABLE gold.extcalendar
WITH(
    LOCATION = 'extcalendar',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.calendar


-- SELECT * from gold.calendar
