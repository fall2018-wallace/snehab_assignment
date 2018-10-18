
stateName <- state.name
area <- state.area
center <- state.center
df <- data.frame(stateName,area,center) # creation of new data frame

mergedf <- merge(mergedData,df, by.x = "StateName", by.y = "stateName") # merging it with final data frame 
View(mergedf)

mergedf$StateName <- tolower(mergedf$StateName) #because ggplot,ggmap supports only lower case
mergedf
