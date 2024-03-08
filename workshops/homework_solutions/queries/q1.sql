CREATE MATERIALIZED VIEW trip_time_stats AS
SELECT
    pu.zone AS pickup_zone,
    dro.zone AS dropoff_zone,
    AVG(EXTRACT(EPOCH FROM (t.tpep_dropoff_datetime - t.tpep_pickup_datetime))/60) AS avg_trip_time_minutes,
    MIN(EXTRACT(EPOCH FROM (t.tpep_dropoff_datetime - t.tpep_pickup_datetime))/60) AS min_trip_time_minutes,
    MAX(EXTRACT(EPOCH FROM (t.tpep_dropoff_datetime - t.tpep_pickup_datetime))/60) AS max_trip_time_minutes
FROM
    trip_data t
INNER JOIN
    taxi_zone pu ON t.PULocationID = pu.location_id
INNER JOIN
    taxi_zone dro ON t.DOLocationID = dro.location_id  
GROUP BY
    pu.zone, dro.zone
HAVING
    AVG(EXTRACT(EPOCH FROM (t.tpep_dropoff_datetime - t.tpep_pickup_datetime))/60) > (SELECT AVG(EXTRACT(EPOCH FROM (sub.tpep_dropoff_datetime - sub.tpep_pickup_datetime))/60) FROM trip_data sub);
