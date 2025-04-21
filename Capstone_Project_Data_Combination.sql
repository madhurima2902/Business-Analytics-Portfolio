-- Combine Monthly Trip Data for 2024 into a Single Table
-- The original Cyclistic trip data for 2024 was provided as separate monthly tables.
-- This query merges all 12 monthly tables into a unified dataset for streamlined analysis.
  
CREATE OR REPLACE TABLE `aqueous-cargo-456422-q1.bike_data.tripdata_2024_combined` AS
SELECT * FROM `aqueous-cargo-456422-q1.bike_data.Jan_2024`
union all
SELECT * FROM `aqueous-cargo-456422-q1.bike_data.Feb_2024`
union all
SELECT * FROM `aqueous-cargo-456422-q1.bike_data.Mar_2024`
union all
SELECT * FROM `aqueous-cargo-456422-q1.bike_data.Apr_2024`
union all
SELECT * FROM `aqueous-cargo-456422-q1.bike_data.May_2024`
union all
SELECT * FROM `aqueous-cargo-456422-q1.bike_data.Jun_2024`
union all
SELECT * FROM `aqueous-cargo-456422-q1.bike_data.Jul_2024`
union all
SELECT * FROM `aqueous-cargo-456422-q1.bike_data.Aug_2024`
union all
SELECT * FROM `aqueous-cargo-456422-q1.bike_data.Sep_2024`
union all
SELECT * FROM `aqueous-cargo-456422-q1.bike_data.Oct_2024`
union all
SELECT * FROM `aqueous-cargo-456422-q1.bike_data.Nov_2024`
union all
SELECT * FROM `aqueous-cargo-456422-q1.bike_data.Dec_2024`;
