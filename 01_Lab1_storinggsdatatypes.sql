SELECT radio, mcc, cell, lon::float, lat::float, cell_range 
FROM opencellid.public.raw_cell_towers limit 10;

CREATE OR REPLACE TABLE geolab.performance.raw_cell_towers AS
SELECT *, st_point(lon, lat) AS geog
FROM opencellid.public.raw_cell_towers;

SELECT COUNT(1) 
FROM geolab.performance.raw_cell_towers
WHERE ST_DWITHIN(st_point(lon, lat), ST_POINT(0, 51.47684),  5000);

SELECT COUNT(1) 
FROM geolab.performance.raw_cell_towers
WHERE st_dwithin(geog, ST_POINT(0, 51.47684),  5000);
