For the R analysis and visualizations, I used RStudio, which has data upload restrictions. So, I used 2019 and 2020 Q1 data files from the original source for the analysis.

## Install necessay packages
install.packages("tidyverse")
library(tidyverse)
install.packages("lubridate")
library(lubridate)
install.packages("ggplot2")
library(ggplot2)

## Read both CSVs
data_2019 <- read_csv("Divvy_Trips_2019_Q1 - Divvy_Trips_2019_Q1.csv")
data_2020 <- read_csv("Divvy_Trips_2020_Q1 - Divvy_Trips_2020_Q1.csv")

## Check Structure
glimpse(data_2019)
glimpse(data_2020)

## Summary Visuals
### Total Rides by User Type
ggplot(data_2020, aes(x = member_casual, fill = member_casual)) +
  geom_bar()+
  geom_text(stat = "count", aes(label = ..count..), vjust = -0.5, colour = "black") +
  labs(title = "Total Rides by User Type", x = "User Type", y = "Count of Rides") +
  theme_minimal() +
    theme(axis.text.y = element_blank())

![01_Distribution of Rides by User Type](https://github.com/user-attachments/assets/d5bae742-ca91-4e08-9049-184a11de9b28)


### Monthly Ride Trends
data_2020 %>%
  mutate(month = month(ymd_hms(started_at), label = TRUE)) %>%  # Extract month from started_at
  group_by(month, member_casual) %>%
  summarise(rides = n()) %>%
  ggplot(aes(x = month, y = rides, color = member_casual, group = member_casual)) +
  geom_line(size = 1.2) +
  labs(title = "Monthly Ride Trends", x = "Month", y = "Number of Rides") +
  theme_minimal()
![02_Monthly Ride Trends by User Type](https://github.com/user-attachments/assets/72ea626b-f785-4082-a679-67ae2ac2d97c)

