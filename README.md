# Performance Optimization for Geospatial Queries in Snowflake

This project demonstrates practical techniques for optimizing geospatial queries in **Snowflake** using native spatial data types, query tuning strategies, Search Optimization, and H3 indexing.

The work focuses on improving query execution time and efficiency for large-scale geospatial datasets by leveraging Snowflake’s built-in geospatial and indexing capabilities.

---

## Project Overview

Geospatial workloads can be computationally expensive due to complex spatial predicates and large data volumes.  
This project explores multiple optimization techniques to improve performance while maintaining analytical accuracy.

The implementation is based on Snowflake’s official geospatial performance guidance and applies these techniques through hands-on SQL experimentation.

---

## Techniques Implemented

### Native Geospatial Data Types (`GEOGRAPHY`)
- Stored spatial objects as `GEOGRAPHY` columns instead of computing them on the fly
- Demonstrated faster spatial filters using `ST_DWITHIN`

### Optimized Geospatial Joins
- Performed spatial joins using `ST_WITHIN`
- Reduced dataset skew by filtering very large polygons prior to joins
- Achieved significant reductions in join execution time

### Search Optimization for Geospatial Lookups
- Enabled Snowflake Search Optimization on geography columns
- Used H3-based clustering to improve query selectivity
- Accelerated point-in-polygon lookup queries on large datasets

### H3 Indexing for Fast Spatial Queries
- Applied H3 hierarchical spatial indexing for approximate distance calculations
- Used `H3_GRID_DISK` and `H3_GRID_DISTANCE` to speed up proximity searches
- Balanced precision and performance for large-scale geospatial analysis

---

## Tech Stack

- **Snowflake**
- **Snowflake Geospatial** (`GEOGRAPHY`, `ST_*` functions)
- **H3 indexing functions**
- **Search Optimization Service**
- **SQL**
- **GitHub**

---

## Repository Structure

```txt
.
├── 00_setup.sql
├── 01_geography_data_types.sql
├── 02_geospatial_joins.sql
├── 03_search_optimization.sql
├── 04_h3_indexing.sql
└── README.md
