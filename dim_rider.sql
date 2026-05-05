CREATE EXTERNAL TABLE dbo.dim_rider
WITH (
    LOCATION     = 'dim_rider',
    DATA_SOURCE = divvy_data_source,
    FILE_FORMAT = SynapseDelimitedTextFormat
)  
AS
SELECT 
rider_id,
first AS first_name,
last AS last_name,
birthday,
address
FROM ext_rider;
GO