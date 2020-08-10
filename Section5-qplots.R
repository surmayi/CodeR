library(ggplot2)

?ggplot2
?qplot
head(stats)
qplot(data=stats, x= Internet.users,bins=100)

qplot(data=stats, x= Income.Group, y=Birth.rate, size= I(1),colour=I("blue"))

qplot(data=stats,x=Internet.users,y=Birth.rate,size=I(1),color=I('Red'))

qplot(data=stats,x=Internet.users,y=Birth.rate,size=I(1),color=Income.Group)

regions <- data.frame(Countries_2012_Dataset,Codes_2012_Dataset,
                      Regions_2012_Dataset)
head(regions)

colnames(regions) <- c('Country.Name','Country.Code','CountryRegion')

rm(regions)

regions <- data.frame(Country.Name=Countries_2012_Dataset,Country.Code=Codes_2012_Dataset,
                      Country.Region= Regions_2012_Dataset)
head(regions)

levels(regions$Country.Region)
summary(regions)

qplot(data=stats,x=Internet.users,y=Birth.rate,size=I(2),color=regions$Country.Region)

merged <- merge(stats,regions,by.x = 'Country.Code',by.y = 'Country.Code')
head(merged)
merged$Country.Name.y <- NULL
merged$Country.Name <- merged$Country.Name.x
merged$Country.Name.x <- NULL

qplot(data=merged,x=Internet.users,y=Birth.rate,size=I(2),color=Country.Region,shape=I(2))
