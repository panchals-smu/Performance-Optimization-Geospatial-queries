SELECT t1.dauid, count(t2.lat) AS count_towers 
FROM geolab.performance.canada_dissemination_areas t1
INNER JOIN geolab.performance.raw_cell_towers t2 ON st_within(t2.geog, t1.geog)
GROUP BY 1;

SELECT CASE
       WHEN st_area(geog) < 1e+8 THEN '0 - 100M'
       WHEN st_area(geog) >= 1e+8 AND ST_AREA(geog) < 1e+9 THEN '100M-1B'
       WHEN st_area(geog) >= 1e+9 AND ST_AREA(geog) < 1e+10 THEN '1B - 10B'
       WHEN st_area(geog) >= 1e+10 THEN '10B and more'
       END AS area_bucket,
       count(*) AS COUNT
FROM geolab.performance.canada_dissemination_areas
GROUP BY 1
ORDER BY 2 DESC;

SELECT t1.dauid, count(t2.lat) AS count_towers 
FROM geolab.performance.canada_dissemination_areas t1
INNER JOIN geolab.performance.raw_cell_towers t2 ON ST_WITHIN(t2.geog, t1.geog)
WHERE ST_AREA(t1.geog) < 1e+10
GROUP BY 1;


