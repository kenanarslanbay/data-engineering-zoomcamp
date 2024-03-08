CREATE MATERIALIZED VIEW busiest_zones AS
SELECT
    tz.Zone AS pickup_zone,
    COUNT(*) AS pickup_count
FROM
    trip_data td
JOIN
    taxi_zone tz ON td.PULocationID = tz.location_id
WHERE
    td.tpep_pickup_datetime > (
        SELECT MAX(tpep_pickup_datetime) - INTERVAL '17 hours'
        FROM trip_data
    )
GROUP BY
    tz.Zone;