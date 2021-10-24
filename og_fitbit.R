install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")
install.packages("lubridate")
library(tidyverse)
library(skimr)
library(janitor)
library(lubridate)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Setting Working Directory to Load CSV
setwd("/Users/dailondolojan/Documents/Projects/FitBit_Case_Study/Fitbit_Data")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Loading "heartrate_seconds_merged.csv" file & creating a new date_time column
# that converts the strings of the Time column into datetime data types
heartrate_seconds_df <- read_csv("heartrate_seconds_merged.csv") %>%
  mutate(date_time = mdy_hms(Time))

# Dropping the Time column
heartrate_seconds_df$Time <- NULL

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Loading "hourlyCalories_merged.csv"" file & creating date_time col from ActivityHour
hourly_calories_df <- read_csv("hourlyCalories_merged.csv") %>%
  mutate(date_time = mdy_hms(ActivityHour))

#Dropping the ActivityHour column
hourly_calories_df$ActivityHour <- NULL

calories <- read_csv("hourlyCalories_merged.csv")
calories$ActivityHour=as.POSIXct(calories$ActivityHour, format="%m/%d/%Y %I:%M:%S %p", tz=Sys.timezone())
calories$time <- format(calories$ActivityHour, format = "%H:%M:%S")
calories$date <- format(calories$ActivityHour, format = "%m/%d/%y")
glimpse(calories)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Loading "hourlyIntensities_merged.csv"" file & creating date_time col from ActivityHour
hourly_intensities_df <- read_csv("hourlyIntensities_merged.csv") %>%
 mutate(date_time = mdy_hms(ActivityHour))

#Dropping the ActivityHour column
hourly_intensities_df$ActivityHour <- NULL

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Loading "hourlySteps_merged.csv"" file & creating date_time col from ActivityHour
hourly_steps_df <- read_csv("hourlySteps_merged.csv") %>%
  mutate(date_time = mdy_hms(ActivityHour))

#Dropping the ActivityHour column
hourly_steps_df$ActivityHour <- NULL

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Loading "minuteCaloriesNarrow_merged.csv"" file & creating date_time col from ActivityMinute
minute_calories_narrow_df <- read_csv("minuteCaloriesNarrow_merged.csv") %>%
  mutate(date_time = mdy_hms(ActivityMinute))

#Dropping the ActivityMinute column
minute_calories_narrow_df$ActivityMinute <- NULL
glimpse(minute_calories_narrow_df)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Loading "minuteCaloriesWide_merged.csv"" file & creating date_time col from ActivityHour
minute_calories_wide_df <- read_csv("minuteCaloriesWide_merged.csv")# %>%

ex <- gather(minute_calories_wide_df, Calories, Values, Calories00Calories59, factor_key = TRUE)
print(ex)  
glimpse(minute_calories_wide_df)
mutate(date_time = mdy_hms(ActivityHour))

#Dropping the ActivityHour column
minute_calories_wide_df$ActivityHour <- NULL
glimpse(minute_calories_wide_df)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
