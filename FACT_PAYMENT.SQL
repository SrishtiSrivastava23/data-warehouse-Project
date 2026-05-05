CREATE EXTERNAL TABLE dbo.fact_payment
WITH (
    LOCATION = 'fact_payment',
    DATA_SOURCE = divvy_data_source,
    FILE_FORMAT = SynapseDelimitedTextFormat
)
AS
SELECT
 payment_id,
 rider_id,
 CAST(CONVERT(VARCHAR(8), CAST(date AS DATE), 112) AS INT) AS date_key,
 amount
FROM ext_payment;
GO