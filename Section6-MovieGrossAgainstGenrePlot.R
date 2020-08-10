movies <- read.csv('Documents/GitHub/CodeR/Section6-Homework-Data.csv')
summary(movies)
levels(movies$Studio)
movies[((movies$Studio == 'Buena Vista Studios') |
          (movies$Studio == 'Paramount Pictures')|
          (movies$Studio == 'Fox') |
          (movies$Studio == 'Sony') | 
          (movies$Studio == 'Universal') | 
          (movies$Studio == 'WB')),  ]

movies <- movies[((movies$Studio == 'Buena Vista Studios') |
                   (movies$Studio == 'Paramount Pictures')|
                   (movies$Studio == 'Fox') |
                   (movies$Studio == 'Sony') | 
                   (movies$Studio == 'Universal') | 
                   (movies$Studio == 'WB')),  ]

movies 

movies <- movies[((movies$Genre =='action')|
          (movies$Genre =='adventure')|
          (movies$Genre =='comedy')|
          (movies$Genre =='drama')|
          (movies$Genre =='animation')),]
str(movies)
levels(movies$Studio)
head(movies)

p <- ggplot(data=movies,aes(x=Genre,y=Gross...US))+ 
  geom_jitter(aes(color=Studio,size=Budget...mill.),alpha=0.5)+
  geom_boxplot(alpha=0.5) +
  xlab(label = 'Genre') +
  ylab(label = 'Gross % US')+
  ggtitle('Domestic Gross % by Genre') +
  theme(axis.title.x = element_text(colour = 'Blue',size=30),
        axis.title.y = element_text(colour = 'Blue',size=30),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        plot.title = element_text(size = 30,colour = 'Black'))
p$labels$size = "Budget $M"
p
