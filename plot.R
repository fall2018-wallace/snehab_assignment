
library(ggplot2)
library(gmap)

# Step B: Generate a color coded map
# 3)	Create a color coded map, based on the area of the state 
mapc <- ggplot(mergedf,aes(map_id=StateName)) # defining the aesthetics 
mapc <- mapc + geom_map(map=mappedData,aes(fill=mergedf$area)) # filling with the area using geom_map function
mapc <- mapc + expand_limits(x=mappedData$long,y=mappedData$lat) #setting the coords as lat and long
mapc <- mapc + coord_map() + ggtitle("Plot of a Map") # plot the map
mapc 

# Step C: Create a color shaded map of the U.S. based on the Murder rate for each state 
# 4)	Repeat step B, but color code the map based on the murder rate of each state.
mapc1<- ggplot(mergedf,aes(map_id=StateName)) # defining the aesthetics 
mapc1 <- mapc1 + geom_map(map=mappedData,aes(fill=mergedf$Murder)) #  filling with the murder rate using geom_map function
mapc1 <- mapc1 + expand_limits(x=mappedData$long,y=mappedData$lat)  # setting the coords as lat and long
mapc1 <- mapc1 + coord_map() + ggtitle("Murder Rate Map") # plot the map
mapc1


# 5)	 Show the population as a circle per state (the larger the population, the larger the circle), using the location defined by the center of each state
mapc2 <- ggplot(mergedf,aes(map_id=StateName)) # defining the aesthetics 
mapc2 <- mapc2 + geom_map(map=mappedData,aes(fill=mergedf$Murder)) # filling with the murder rate using geom_map function
mapc2 <- mapc2 + expand_limits(x=mappedData$long,y=mappedData$lat) # setting the coords as lat and long
mapc2 <- mapc2 + geom_point(aes(x=x,y=y,size=mergedf$population)) #plotting the points as circle per state using the location by the center of each state
mapc2 <- mapc2 + coord_map() + ggtitle("Population Map") # plot the map

# Step D: Zoom the map
# 6)	Repeat step C, but only show the states in the north east
# Hint: get the lat and lon of new york city
# Hint: set the xlim and ylim to NYC +/- 10
latlong <- geocode(source ="dsk","nyc, new york, ny") #getting coords for new york city
latlong

ZoomMap <- ggplot(mergedf, aes(map_id =StateName)) # defining the aesthetics 
ZoomMap <- ZoomMap + geom_map(map = mappedData, aes(fill=mergedf$Murder)) # filling with the murder rate using geom_map function
ZoomMap <- ZoomMap + geom_point(aes(x=mergedf$x,y=mergedf$y,size=mergedf$population))
ZoomMap <- ZoomMap + xlim(latlong$lon-10,latlong$lon + 10) + ylim(latlong$lat-10, latlong$lat+10) #Using xlim and ylim function to zoom the map
ZoomMap <- ZoomMap + coord_map() + ggtitle("Zoomed Map of NYC") # plot the map
ZoomMap
