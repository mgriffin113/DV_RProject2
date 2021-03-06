library("dplyr")
library("tidyr")

# Wrangle the data

# This dataset shows the number of observations made for each vehicle
numOfObservationsPerVehicle<- 
  bus_sample_data %>%
  group_by(VEHICLE_ID) %>%
  summarise(NUM_OBSERVATIONS = n())

# This dataset shows the average distance between stops that each vehicle has along each route it drives
avgDistanceToNextStop<-
  bus_sample_data %>%
  group_by(INFERRED_ROUTE_ID, VEHICLE_ID) %>%
  summarise(AVG_DIST = mean(NEXT_SCHEDULED_STOP_DISTANCE))

# This dataset finds the average time between each stop, and the average distance between each stop for each bus, then calculates average feet per second

avgFeetPerSecond<-
  bus_sample_data %>%
  separate(TIME_RECEIVED,c("DATE_RECEIVED","HOUR_RECEIVED"),sep=" ") %>%
  filter(DATE_RECEIVED=="2014-08-02") %>%
  group_by(VEHICLE_ID) %>%
  arrange(HOUR_RECEIVED) %>%
  separate(HOUR_RECEIVED,c("HOUR","MINUTE","SECONDS"),sep=":") %>%
  mutate(HOUR_DIFF = as.integer(lead(HOUR))-as.integer(HOUR), MIN_DIFF = as.integer(lead(MINUTE))-as.integer(MINUTE), SEC_DIFF = as.integer(lead(SECONDS))-as.integer(SECONDS)) %>%
  mutate(TIME_DIFF = HOUR_DIFF + 60 * MIN_DIFF + SEC_DIFF) %>%
  filter(TIME_DIFF > 0) %>%
  group_by(VEHICLE_ID) %>%
  summarise(AVG_TIME_DIFF = mean(TIME_DIFF),AVG_STOP_DIST = mean(NEXT_SCHEDULED_STOP_DISTANCE)) %>%
  mutate(AVG_FPS = AVG_STOP_DIST/AVG_TIME_DIFF)
  

