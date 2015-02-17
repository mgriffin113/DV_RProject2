#produce plots from wrangled data sets
library(ggplot2)

numTrips <- ggplot(numOfTripsPerVehicle, aes(x=VEHICLE_ID, y=NUM_TRIPS)) + geom_bar(stat="identity")

print(numTrips)

stopDist <- ggplot(avgDistanceToNextStop, aes(x=INFERRED_ROUTE_ID, y=AVG_DIST, color=VEHICLE_ID)) + geom_bar(stat="identity")

print(stopDist)

fps <- ggplot(avgFeetPerSecond, aes(x=VEHICLE_ID, y=AVG_FPS)) + geom_bar(stat="identity")

print(fps)
