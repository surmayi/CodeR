getwd()

util <- read.csv('Documents/GitHub/CodeR/P3-Machine-Utilization.csv', na.strings = 0)
head(util,10) 

summary(util)
str(util)

util$utilization <- 1- util$Percent.Idle

head(util,10)
?POSIXct

util$PosTime <- as.POSIXct(util$Timestamp,format ='%d/%m/%Y %H:%M')
head(util,12)
str(util)
summary(util)
util$Timestamp <- NULL
util <- util[,c(4,1,2,3)]

RL1 <- util[util$Machine=='RL1',]
RL1$Machine <- factor(RL1$Machine)
summary(RL1)
str(RL1)
util_stats <- c(min(RL1$utilization,na.rm = T),
                mean(RL1$utilization,na.rm = T),
                max(RL1$utilization,na.rm = T))
util_stats

under90<-length(which(RL1$utilization<0.9)) >0

lis <- list('RL1',util_stats,under90)

names(lis) <- c('Machine','Stats','LowThreshold')
names(lis)
lis['Stats']

lis1 <- list(Machine='RL1',Stats=util_stats,LowThreshold=under90)
lis1
lis[3]
lis[[3]]
lis[[2]][3]
lis$Stats[3]
typeof(lis[2])
typeof(lis[[2]])
typeof(lis$Stats[1])
typeof(lis[[3]])

lis1[[3]] <- FALSE
lis1


RL1[is.na(RL1$utilization),'PosTime']

lis$UnknownHours <- RL1[is.na(RL1$utilization),'PosTime']

lis[3] <- 'New Information2'

lis[c(5,6,7)] <-NULL

lis$Data <- RL1
summary(lis)

lis$UnknownHours[1]
lis[[4]][1]
lis[c(2,4)][[1]][2:3]



















