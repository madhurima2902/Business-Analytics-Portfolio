Introduction
In this case study, I will perform many real-world tasks of a junior data analyst at a fictional company, Cyclistic. In order to answer the key business questions, I will follow the steps of the data analysis process: Ask, Prepare, Process, Analyze, Share, and Act.

Quick links:
Data Source: divvy_tripdata [accessed on 04/22/25](https://divvy-tripdata.s3.amazonaws.com/index.html)

SQL Queries:
01. [Data Combination](https://github.com/madhurima2902/Business-Analytics-Portfolio/blob/main/Capstone%20Project_Cyclistic%20bike-share%20analysis/01_Data%20Combination.sql)
02. [Data Exploration and Quality Checks](https://github.com/madhurima2902/Business-Analytics-Portfolio/blob/main/Capstone%20Project_Cyclistic%20bike-share%20analysis/02_Data_Exploration_%26_Quality_Checks.sql)
03. [Data Cleaning](https://github.com/madhurima2902/Business-Analytics-Portfolio/blob/main/Capstone%20Project_Cyclistic%20bike-share%20analysis/03_Data_Cleaning.sql)
04. [Data Analysis](https://github.com/madhurima2902/Business-Analytics-Portfolio/blob/main/Capstone%20Project_Cyclistic%20bike-share%20analysis/04_Data_Analysis.sql)

Data Visualizations: Tableau

# Cyclistic Bike-Share Capstone Project

## Background
Cyclistic is a bike-share program in Chicago with over 5,800 bikes and 600 docking stations. In addition to standard bikes, it offers inclusive options such as reclining bikes, hand tricycles, and cargo bikes, making cycling accessible to a wider population. While most riders use traditional bikes, about 8% use these assistive options.

Cyclistic offers three pricing plans: single-ride, full-day, and annual memberships. Riders using single or full-day passes are referred to as casual riders, while annual subscribers are known as members. Finance analysts have identified that annual members generate more consistent revenue and higher profitability than casual riders.

To support growth, the director of marketing, Moreno, believes the company should focus on converting casual riders into annual members. Casual riders are already familiar with Cyclistic and have chosen it for their transportation needs, making them a strategic segment to target.

To achieve this goal, the marketing team requires a detailed analysis of usage patterns between casual and member riders. This project focuses on identifying those differences using historical trip data.

## Scenario

In this project, I take on the role of a junior data analyst on the marketing team at Cyclistic. My primary objective is to analyze how annual members and casual riders use Cyclistic bikes differently, and provide data-driven recommendations to support a marketing strategy focused on converting casual riders into members. The insights will be presented using compelling visualizations and will form the foundation for an upcoming executive pitch.

## Ask

**Business Task:**  
Devise data-informed marketing strategies to convert casual riders into annual members.

**Key Questions:**
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders consider becoming members?
3. How can digital media influence casual riders to become members?

This analysis specifically answers the first question.

## Prepare

**Data Source:**  
Trip data from January to December 2024, originally provided as 12 separate monthly CSV files and made publicly available by Motivate International Inc. under a permissive license. The data excludes personally identifiable information in accordance with privacy policies.

**Data Structure:**  
Each file contains fields such as ride ID, rideable type, timestamps for trip start and end, start and end station names/IDs, lat/lng coordinates, and user type (`member_casual`). 

## Process

Due to the size of the dataset, all preprocessing and data manipulation were performed in **Google BigQuery**, which supports large-scale data analysis.

### Data Cleaning Steps:
- Combined 12 monthly tables into a single table
- Removed duplicate ride IDs
- Filtered out entries with:
  - Zero or negative ride duration
  - Missing start or end station names
- Added derived columns: `ride_length_minutes`, `day_of_week`, `month`, `hour_of_day`

**Tools Used:**
- BigQuery (for SQL queries and data transformation)
- Google Sheets (for pivot tables and basic visualizations)
- R (with tidyverse, ggplot2 for advanced visualizations)
- Tableau (for interactive dashboards and executive presentations)

## Analyze and Share

### Analysis Focus Areas:
- Distribution of rides by user type
- Rideable type preferences
- Temporal usage patterns:
  - By day of the week
  - By hour of the day
  - By month
- Ride duration comparisons
- Start and end station trends

### Visualizations:
I created visualizations across Google Sheets, R, and Tableau to highlight key trends:

| Analysis View | Tool Used | Link |
|---------------|-----------|------|
| Pivot Tables & Charts (Day/Hour/Month Trends) | Google Sheets | [View Google Sheets](https://docs.google.com/spreadsheets/d/1hLZ32S3P3WnF_oUOJc5Lrw9-yDW97XnwFPIKercftM0/edit?gid=1747179733#gid=1747179733) |
| Static Charts (Boxplots, Bar Charts, Ride Duration Trends) | R (ggplot2) | [View R Visuals](#) |
| Interactive Dashboards (All-in-one view) | Tableau Public | [View 
 Tableau Visuals](https://public.tableau.com/app/profile/ghoshmadhurima/viz/CyclisticBike-ShareCapstoneProject_17453557172800/Cyclistic2024-Summary) |

### Summary of Key Findings:
| Casual Riders | Member Riders |
|---------------|----------------|
| Ride longer on average (2x duration) | Shorter, more consistent ride durations |
| Prefer weekends and daytime hours | Ride most during weekday peak hours (commute times) |
| More active in spring/summer for leisure | Consistent year-round usage for commuting |
| Start/end near tourist/recreational locations | Start/end near residential, work, or transit zones |

## Act

### Recommendations:

1. **Seasonal Promotions:**  
   Launch targeted marketing during weekends and in warmer months when casual rider activity is highest.

2. **Weekend/Leisure Pass to Membership Offers:**  
   Introduce flexible membership plans or discounts for riders who frequently ride on weekends.

3. **Digital Retargeting:**  
   Use ride history to trigger personalized offers via app notifications or email, especially after 3–5 casual rides.
