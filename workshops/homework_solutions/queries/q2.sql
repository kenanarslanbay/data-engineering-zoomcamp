WITH HighestAvgTripTime AS (
  SELECT
    pickup_zone,
    dropoff_zone
  FROM
    trip_time_stats
  ORDER BY
    avg_trip_time_minutes DESC
  LIMIT 1
)
SELECT
  pickup_zone,
  dropoff_zone,
  COUNT(*) AS num_trips
FROM
  trip_data
JOIN
  taxi_zone pu ON trip_data.PULocationID = pu.location_id
JOIN
  taxi_zone dro ON trip_data.DOLocationID = dro.location_id
JOIN
  HighestAvgTripTime hat ON pu.zone = hat.pickup_zone AND dro.zone = hat.dropoff_zone
GROUP BY
  pickup_zone,
  dropoff_zone;
