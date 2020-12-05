fin <- read.csv('Documents/GitHub/CodeR/P3-Future-500-The-Dataset.csv')
head(fin)

summary(fin)
str(fin)

?factor

fin$ID <- factor(fin$ID)

fin$Inception <- factor(fin$Inception)

str(fin)

a <- c('11','12','11')
typeof(a)
z <- factor(c('11','12','11'))
typeof(z)

b <- as.numeric(z)
typeof(b)
b
c <- as.numeric(as.character(z))
c

fin$Expenses <- gsub(' Dollars','', fin$Expenses)
fin$Expenses <- gsub(',','', fin$Expenses)
str(fin)

fin$Revenue <- gsub('\\$','', fin$Revenue)
fin$Revenue <- gsub(',','', fin$Revenue)
str(fin)

head(fin)

fin$Growth <- gsub('%','',fin$Growth)
str(fin)

fin$Revenue  <- as.numeric(fin$Revenue )
fin$Growth  <- as.numeric(fin$Growth )
fin$Expenses  <- as.numeric(fin$Expenses )

head(fin,24)
summary(fin)

fin[complete.cases(fin)==FALSE,]

# set all blank values to NA
fin <- read.csv('Documents/GitHub/CodeR/P3-Future-500-The-Dataset.csv', na.strings = c(''))

fin$Expenses <- gsub(' Dollars','', fin$Expenses)
fin$Expenses <- gsub(',','', fin$Expenses)
str(fin)

fin$Revenue <- gsub('\\$','', fin$Revenue)
fin$Revenue <- gsub(',','', fin$Revenue)
str(fin)

head(fin)

fin$Growth <- gsub('%','',fin$Growth)
str(fin)

fin$Revenue  <- as.numeric(fin$Revenue )
fin$Growth  <- as.numeric(fin$Growth )
fin$Expenses  <- as.numeric(fin$Expenses )

fin[complete.cases(fin)==FALSE,]
summary(fin)
str(fin)
fin[fin$Revenue==9746272,]
fin[!is.na(fin$Revenue) & fin$Revenue==9746272,]
fin[which(fin$Revenue==9746272),]

fin[which(fin$Employees==45),]

fin[fin$Employees==45,]

head(fin,24)

fin[is.na(fin$Expenses),]

fin_bkp <- fin

fin <- fin_bkp

fin[complete.cases(fin)==FALSE,]

fin <- fin[!is.na(fin$Industry),]

rownames(fin) <- NULL
fin[complete.cases(fin)==FALSE,]

fin[is.na(fin$State) & fin$City=='New York','State'] <-'NY'
fin[is.na(fin$State) & fin$City=='San Francisco','State'] <-'CA'

fin[complete.cases(fin)==FALSE,]

fin[c(11,377,82,265),]

fin[!is.na(fin$Employees) &fin$Industry=='Financial Services',]

m<-median(fin[!is.na(fin$Employees) &fin$Industry=='Financial Services',"Employees"])
m
fin[is.na(fin$Employees) &fin$Industry=='Financial Services',"Employees"] <- m

fin[!is.na(fin$Employees) &fin$Industry=='Retail',]

m<-median(fin[!is.na(fin$Employees) &fin$Industry=='Retail',"Employees"])
m
fin[is.na(fin$Employees) &fin$Industry=='Retail',"Employees"] <- m

fin[330,]

fin[is.na(fin$Employees),]

fin[complete.cases(fin)==FALSE,]

fin[is.na(fin$Growth)& fin$Industry=='Construction',]

mG<- median(fin[!is.na(fin$Growth)& fin$Industry=='Construction','Growth'])
mG
fin[is.na(fin$Growth)& fin$Industry=='Construction','Growth'] <-mG
fin[complete.cases(fin)==FALSE,]

me<-median(fin[!is.na(fin$Expenses) & fin$Industry=='Construction','Expenses'])
fin[is.na(fin$Expenses)  & is.na(fin$Profit) & fin$Industry =='Construction', 'Expenses'] <- me

median(fin[!is.na(fin$Revenue) & fin$Industry=='Construction','Revenue'])
mR<-median(fin[!is.na(fin$Revenue) & fin$Industry=='Construction','Revenue'])
fin[is.na(fin$Revenue)  & fin$Industry =='Construction', 'Revenue'] <- mR

fin[complete.cases(fin)==FALSE,]

fin[is.na(fin$Profit),'Revenue'] -fin[is.na(fin$Profit),'Expenses']

fin[is.na(fin$Profit),'Profit'] <- fin[is.na(fin$Profit),'Revenue'] -fin[is.na(fin$Profit),'Expenses']

fin[complete.cases(fin)==FALSE,]

fin[is.na(fin$Expenses),'Expenses'] <- fin[is.na(fin$Expenses),'Revenue'] -fin[is.na(fin$Expenses),'Profit']

fin[complete.cases(fin)==FALSE,]

#Visualizing Result

library(ggplot2)

p <- ggplot(data=fin)
p+ geom_point(aes(x=Revenue,y=Expenses,color=Industry,size=Profit))

q <- ggplot(data=fin,aes(x=Revenue,y=Expenses,color=Industry))

q + geom_point() + geom_smooth(fill=NA)

b <- ggplot(data=fin,aes(x=Industry,y=Growth,color=Industry))
b+ geom_jitter()+  geom_boxplot(alpha=0.5) + 
  theme(axis.text.x = element_text(size=5))
