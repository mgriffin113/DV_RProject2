#produce plots from wrangled data sets
library("ggplot2")

numObservations <- ggplot(numOfObservationsPerVehicle, aes(x=as.factor(VEHICLE_ID), y=NUM_OBSERVATIONS)) + geom_bar(stat="identity", aes(fill = factor(VEHICLE_ID)))

print(numObservations)

stopDist <- ggplot(avgDistanceToNextStop, aes(x=AVG_DIST)) + geom_histogram(binwidth=50,fill="red",col="black")

print(stopDist)

fps <- ggplot(avgFeetPerSecond, aes(x=factor(VEHICLE_ID), y=AVG_FPS,fill=factor(VEHICLE_ID))) + geom_bar(stat="identity")

print(fps)
