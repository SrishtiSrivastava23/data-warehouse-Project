CREATE EXTERNAL TABLE dbo.fact_trip
WITH (
    LOCATION = 'fact_trip',
    DATA_SOURCE = divvy_data_source,
    FILE_FORMAT = SynapseDelimitedTextFormat
)
AS
SELECT
    t.trip_id,
    t.rider_id,
    t.start_station_id,
    t.end_station_id,

    CAST(CONVERT(VARCHAR(8), CAST(t.start_at AS DATE), 112) AS INT) AS date_key,

    DATEDIFF(MINUTE, t.start_at, t.ended_at) AS trip_duration_minutes,

    DATEDIFF(YEAR, r.birthday, t.start_at)
    -

    CASE 
        WHEN MONTH(r.birthday) > MONTH(t.start_at)
        OR (MONTH(r.birthday) = MONTH(t.start_at)
            AND DAY(r.birthday) > DAY(t.start_at))
        THEN 1 ELSE 0
    END AS rider_age

FROM ext_trip t
JOIN ext_rider r
    ON t.rider_id = r.rider_id;
GO
