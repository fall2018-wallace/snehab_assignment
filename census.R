
dfStates<-read.csv("scprc_est_2017_18_pop_res.csv", stringsAsFactors = FALSE)
  head(dfStates)
  tail(dfStates)
  dfStates<-dfStates[-c(1,53),]
  summary(dfStates)
  str(dfStates)
  dfStates<-dfStates[,-1:-4]
  colnames(dfStates)<-c("StateName","population","popOver18","percentOver18")
  dfStates
