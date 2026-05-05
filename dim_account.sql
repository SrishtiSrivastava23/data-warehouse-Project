CREATE EXTERNAL TABLE dbo.dim_account
WITH (
    LOCATION = 'dim_account',
    DATA_SOURCE = divvy_data_source,
    FILE_FORMAT = SynapseDelimitedTextFormat
)
AS
SELECT 
    rider_id AS account_number,
    is_member AS member,
    account_start_date AS start_date,
    account_end_date AS end_date
FROM ext_rider;
GO