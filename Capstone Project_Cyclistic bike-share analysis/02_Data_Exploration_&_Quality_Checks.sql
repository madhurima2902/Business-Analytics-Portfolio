--Data Exploration and Quality Checks*

-- Display Table
SELECT *
FROM
`aqueous-cargo-456422-q1.bike_data.tripdata_2024_combined`

-- Counting Total Rows
SELECT 
  COUNT(*) AS Count_total_Rides
FROM
`aqueous-cargo-456422-q1.bike_data.tripdata_2024_combined`

-- Ride Count by Month
SELECT 
  FORMAT_DATE('%Y-%m', DATE(started_at)) AS ride_month,
  COUNT(*) AS total_rides
FROM `aqueous-cargo-456422-q1.bike_data.tripdata_2024_combined`
GROUP BY ride_month
ORDER BY ride_month;

-- Ride count by Bike Type
SELECT 
  rideable_type, COUNT(*) AS ride_count
FROM `aqueous-cargo-456422-q1.bike_data.tripdata_2024_combined`
GROUP BY rideable_type
ORDER By ride_count DESC ;

-- Ride count by User Type
SELECT 
 member_casual AS user_type,
 COUNT(*) AS user_count
FROM `aqueous-cargo-456422-q1.bike_data.tripdata_2024_combined`
GROUP BY member_casual
ORDER By user_count DESC ;

-- Ride Duration Summary
SELECT 
  MIN(DATETIME_DIFF(ended_at, started_at, MINUTE)) AS min_duration,
  MAX(DATETIME_DIFF(ended_at, started_at, MINUTE)) AS max_duration,
  AVG(DATETIME_DIFF(ended_at, started_at, MINUTE)) AS avg_duration
FROM `aqueous-cargo-456422-q1.bike_data.tripdata_2024_combined`;

-- Checking for Null values in Key Columns
SELECT 
  COUNTIF(ride_id IS NULL) AS null_ride_id,
  COUNTIF(started_at IS NULL) AS null_started_at,
  COUNTIF(ended_at IS NULL) AS null_ended_at,
  COUNTIF(member_casual IS NULL) AS null_user_type
FROM `aqueous-cargo-456422-q1.bike_data.tripdata_2024_combined`;
-- Output -> all values are 0 indicating no missing values for these columns

-- Counting for duplicate values
SELECT
 ride_id, COUNT(*)
FROM `aqueous-cargo-456422-q1.bike_data.tripdata_2024_combined`
GROUP BY ride_id
HAVING COUNT(*) > 1 ;
-- There are 211 rows which have count value > 1. These rows have duplicate data

-- Checking for invalid rides (duration <=0)
SELECT
 COUNT(*) AS invalid_ride
FROM
`aqueous-cargo-456422-q1.bike_data.tripdata_2024_combined`
WHERE timestamp_diff(ended_at, started_at, MINUTE ) <= 0 ;
-- O/P -> 131530 counts where the duration is <=0.

--Checking for unrealistic or future dates
SELECT
min(started_at) AS first_ride_2024,
max(ended_at) AS last_ride_2024
FROM
`aqueous-cargo-456422-q1.bike_data.tripdata_2024_combined` */
-- O/P ->2024-01-01 00:00:39 UTC 2024-12-31 23:59:55.705000 UT indicating no future dates or unrealistic dates

-- Checking for Missing Station Information
SELECT
 COUNTIF(start_station_id IS NULL) AS Invalid_start,
 COUNTIF(end_station_id IS NULL) AS Invalid_end
FROM
`aqueous-cargo-456422-q1.bike_data.tripdata_2024_combined` ;
-- O/P -> Invalid_start- 1073951, Invalid_end - 1104653 
