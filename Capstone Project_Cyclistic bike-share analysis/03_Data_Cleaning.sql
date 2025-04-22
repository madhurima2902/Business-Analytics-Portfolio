-- Step 1: Data Cleaning
-- Objective: Remove duplicate ride entries, entries with non-positive trip durations, 
-- and entries with missing start or end station names.

-- Creating a cleaned version of the combined trip data table.
-- - ROW_NUMBER() is used to identify and retain only the first occurrence of each ride_id (i.e., remove duplicates)
-- - Trips with ride duration less than or equal to 0 minutes are excluded
-- - Trips missing start or end station names are also excluded

CREATE OR REPLACE TABLE `aqueous-cargo-456422-q1.bike_data.tripdata_2024_combined_cleaned` AS
SELECT * EXCEPT (row_num)
FROM (
  SELECT *, 
         ROW_NUMBER() OVER (PARTITION BY ride_id ORDER BY started_at) AS row_num
  FROM `aqueous-cargo-456422-q1.bike_data.tripdata_2024_combined`
)
WHERE row_num = 1
  AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) > 0
  AND start_station_name IS NOT NULL
  AND end_station_name IS NOT NULL;

-- Optional sanity check: Count of valid, cleaned records
SELECT COUNT(*)
FROM `aqueous-cargo-456422-q1.bike_data.tripdata_2024_combined_cleaned`;
-- Output: 4,168,539 valid records


-- Step 2: Feature Engineering / Data Enrichment
-- Objective: Add useful derived fields to support analysis:
-- - ride_length_minutes: duration of each ride in minutes
-- - day_of_week: day name (e.g., Monday) for the ride start date
-- - month: full month name of the ride
-- - hour_of_day: hour of the day when the ride started

CREATE OR REPLACE TABLE `aqueous-cargo-456422-q1.bike_data.tripdata_2024_combined_cleaned_enriched` AS
SELECT *,
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length_minutes,
  FORMAT_TIMESTAMP('%A', started_at) AS day_of_week,
  FORMAT_TIMESTAMP('%B', started_at) AS month,
  EXTRACT(HOUR FROM started_at) AS hour_of_day
FROM `aqueous-cargo-456422-q1.bike_data.tripdata_2024_combined_cleaned`;
