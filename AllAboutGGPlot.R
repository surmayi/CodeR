movies <- read.csv('Documents/GitHub/CodeR/P2-Movie-Ratings.csv')
head(movies)
colnames(movies) <- c('Film','Genre','CriticRating','AudienceRating','Budget','Year')

str(movies)

levels(movies$Genre)
levels(movies$Year)
movies$Year <- factor(movies$Year)
summary(movies)

library(ggplot2)

ggplot(data=movies,aes(x=CriticRating,y=AudienceRating)) + geom_point()

ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,color=Genre)) + geom_point()

ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,color=Genre, size=Genre)) + geom_point()

ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,color=Genre, size=Budget))+ geom_point()

p <- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,color=Genre, size=Budget))

p + geom_point()

q <- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,color=Genre, size=Budget))

q + geom_point(aes(size=CriticRating))

q + geom_point(aes(size=Budget))

q + geom_point(aes(x=Budget)) + xlab('Budget')

p + geom_line(size=1) + geom_point() # First Answer

r <- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating))
 r+ geom_point(aes(color=Genre))
 
 r+ geom_point(aes(size=Budget))

 s <- ggplot(data = movies, aes(x=Budget))
 s + geom_histogram(binwidth =10, aes(fill=Genre), color='Black') 

 s+ geom_density(aes(fill=Genre),position = 'stack') 
 
 t <- ggplot(data=movies, aes(x=AudienceRating))

 t+ geom_histogram(binwidth = 10, fill='Green',color='Black')

 t <- ggplot(data=movies) 
 
 t+ geom_histogram(binwidth = 10,aes(x=AudienceRating), fill='Green',color='Black')
 t+ geom_histogram(binwidth = 10,aes(x=CriticRating), fill='Blue',color='Black')

u <- ggplot(data=movies, aes(x=Genre,y=AudienceRating,color=Genre))
u+ geom_point() + geom_smooth(fill=NA) 

u + geom_boxplot(size=1.2)

u + geom_boxplot(size=1.2) + geom_point()

u + geom_boxplot(size=1.2) + geom_jitter()

u +geom_jitter()+ geom_boxplot(size=1.2,alpha=0.5)

v <- ggplot(data=movies,aes(x=Budget))
v+ geom_histogram(binwidth = 10, aes(fill=Genre),color='Black')

v+ geom_histogram(binwidth = 10, aes(fill=Genre),color='Black')+ facet_grid(Genre~.,scale='free')

w <- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,color=Genre))

w+ geom_point() + facet_grid(Genre~.)

w+ geom_point() + facet_grid(.~Year)

w+ geom_point() + facet_grid(Genre~Year)

w+ geom_point(aes(size=Budget)) + facet_grid(Genre~Year)

w+ geom_point(aes(size=Budget)) + facet_grid(Genre~Year) + geom_smooth()

m <- ggplot(data=movies, aes(x= CriticRating,y=AudienceRating,size=Budget, color=Genre))
m+ geom_point()

m + geom_point() + xlim(0,50) + ylim(50,100)

n <- ggplot(data=movies, aes(x=Budget))
 n + geom_histogram(binwidth = 10, aes(fill=Genre),color='Black')
 
 n + geom_histogram(binwidth = 10, aes(fill=Genre),color='Black') + ylim(0,50)
 
 n + geom_histogram(binwidth = 10, aes(fill=Genre),color='Black') +
   coord_cartesian(ylim = c(50,75))
 
 w+ geom_point(aes(size=Budget)) + geom_smooth()+ facet_grid(Genre~Year)+
   coord_cartesian(ylim = c(0,100))
 
 