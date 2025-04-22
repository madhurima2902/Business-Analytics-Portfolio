-- Analysis Queries: Cyclistic Bike-Share (2024)
-- Purpose: Explore usage patterns of annual members vs. casual riders
-- Focus Areas:
--   1. Ride counts and durations by user type
--   2. Popular days, hours, and months of usage
--   3. Rideable type preferences
--   4. Trends to support marketing recommendations

-- User Type Distribution
SELECT 
  member_casual , 
  COUNT(*) AS total_rides
FROM
`aqueous-cargo-456422-q1.bike_data.tripdata_2024_combined_cleaned_enriched`
GROUP BY 
  member_casual ;

-- Rideable Type Comparison
SELECT 
  member_casual ,
  rideable_type ,
  COUNT(*) AS total_rides
FROM
`aqueous-cargo-456422-q1.bike_data.tripdata_2024_combined_cleaned_enriched`
GROUP BY 
  member_casual,
  rideable_type ;

-- Ride Duration Comparison
SELECT 
  member_casual ,
  rideable_type ,
  AVG(ride_length_minutes) AS Avg_Ride_Duration ,
  MIN(ride_length_minutes) AS Min_Ride_Duration ,
  MAX(ride_length_minutes) AS Max_Ride_Duration
FROM
`aqueous-cargo-456422-q1.bike_data.tripdata_2024_combined_cleaned_enriched`
GROUP BY 
  member_casual,
  rideable_type ;

-- Day-of-Week Usage
SELECT 
  member_casual ,
  rideable_type ,
  day_of_week,
  COUNT(*) AS Num_Of_Rides
FROM
`aqueous-cargo-456422-q1.bike_data.tripdata_2024_combined_cleaned_enriched`
GROUP BY 
  member_casual,
  rideable_type,
  day_of_week
ORDER BY member_casual,
  CASE day_of_week
    WHEN 'Monday' THEN 1
    WHEN 'Tuesday' THEN 2
    WHEN 'Wednesday' THEN 3
    WHEN 'Thursday' THEN 4
    WHEN 'Friday' THEN 5
    WHEN 'Saturday' THEN 6
    WHEN 'Sunday' THEN 7
  END;
