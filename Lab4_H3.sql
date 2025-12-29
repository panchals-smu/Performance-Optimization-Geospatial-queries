CREATE OR REPLACE TABLE geolab.performance.ny_taxi_rides
AS SELECT *, H3_POINT_TO_CELL(pickup_location, 7) as pickup_h3, 
H3_POINT_TO_CELL(dropoff_location, 7) as dropoff_h3
FROM geolab.performance.ny_taxi_rides;

SELECT CASE
WHEN ST_DISTANCE(pickup_location, dropoff_location) < 100000 then 'under 100'
WHEN ST_DISTANCE(pickup_location, dropoff_location) >= 100000 then 'above 100'
END AS geodesic_distance_bucket,
COUNT(*) as number_of_trips
FROM geolab.performance.ny_taxi_rides
GROUP BY 1;

SELECT CASE
WHEN H3_GRID_DISTANCE(pickup_h3, dropoff_h3) <= 41 THEN 'under 100'
WHEN H3_GRID_DISTANCE(pickup_h3, dropoff_h3) > 41 THEN 'above 100'
END as distance_h3,
COUNT(*) as number_of_trips
FROM geolab.performance.ny_taxi_rides
GROUP BY 1;