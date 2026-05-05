CREATE EXTERNAL TABLE dbo.dim_date
WITH (
    LOCATION = 'dim_date',
    DATA_SOURCE = divvy_data_source,
    FILE_FORMAT = SynapseDelimitedTextFormat
)
AS
SELECT DISTINCT
    CAST(CONVERT(VARCHAR(8), CAST(start_at AS DATE),112) AS INT) AS date_key,
    CAST(start_at AS DATE) AS full_date,
    DATEPART(DAY, start_at) AS day,
    DATEPART(MONTH, start_at) AS month,
    DATEPART(YEAR, start_at) AS year,
    DATEPART(QUARTER, start_at) AS quarter,
    DATEPART(WEEKDAY, start_at) AS weekday
FROM ext_trip;
GO
