

mergedf <- merge(mergedData,df, by.x = "StateName", by.y = "stateName") # merging it with final data frame 
mergedf

mergedf$StateName <- tolower(mergedf$StateName) #because ggplot,ggmap supports only lower case
mergedf
