CREATE EXTERNAL TABLE dbo.dim_date
WITH (
    LOCATION = 'dim_date',
    DATA_SOURCE = divvy_data_source,
    FILE_FORMAT = SynapseDelimitedTextFormat
)
AS
WITH ALLDates AS
(
SELECT CAST(start_at AS DATE) AS date_val FROM dbo.ext_trip
UNION
SELECT CAST(ended_at AS DATE) AS date_val FROM dbo.ext_trip
UNION
SELECT CAST([date] AS DATE) AS date_val FROM dbo.ext_payment
)

SELECT DISTINCT
    CAST(CONVERT(VARCHAR(8), date_val ,112) AS INT) AS date_key,
    date_val AS full_date,
    DATEPART(DAY, date_val) AS day,
    DATEPART(MONTH, date_val) AS month,
    DATEPART(YEAR, date_val) AS year,
    DATEPART(QUARTER, date_val) AS quarter,
    DATEPART(WEEKDAY, date_val) AS weekday
FROM AllDates
WHERE date_val IS NOT NULL;
GO
