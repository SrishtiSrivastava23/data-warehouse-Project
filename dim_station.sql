CREATE EXTERNAL TABLE dbo.dim_station
WITH (
    LOCATION     = 'dim_station',
    DATA_SOURCE = divvy_data_source,
    FILE_FORMAT = SynapseDelimitedTextFormat
)  
AS
SELECT 
station_id,
    name,
    latitude,
    longitude
FROM ext_station;
GO