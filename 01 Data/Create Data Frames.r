# Change this and all subsequent library loading functions to "require" without lib.loc arguments, since we want the scripts to run regardless of local machine directory structure.
library("RCurl")

# We use the RCurl function getURL to pull in the BusData table stored on Michael's oracle account.

bus_sample_data <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from BusData"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_mjg2833', PASS='orcl_mjg2833', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

# Change data types of a few columns and remove null observations.

bus_sample_data$DISTANCE_ALONG_TRIP <- sub(",", "", bus_sample_data$DISTANCE_ALONG_TRIP) 
bus_sample_data$DISTANCE_ALONG_TRIP <- as.numeric(bus_sample_data$DISTANCE_ALONG_TRIP)
bus_sample_data$NEXT_SCHEDULED_STOP_DISTANCE <- sub(",", "", bus_sample_data$NEXT_SCHEDULED_STOP_DISTANCE)
bus_sample_data$NEXT_SCHEDULED_STOP_DISTANCE <- as.numeric(bus_sample_data$NEXT_SCHEDULED_STOP_DISTANCE)
bus_sample_data$TIME_RECEIVED <- as.POSIXct(bus_sample_data$TIME_RECEIVED)
bus_sample_data <- bus_sample_data[!(bus_sample_data$INFERRED_ROUTE_ID %in% 'null'),]