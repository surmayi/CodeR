library(ggplot2)

p <- ggplot(data=util)+ geom_line(aes(x=PosTime,y=utilization,color=Machine))+
  facet_grid(Machine~.)+
  geom_hline(yintercept = 0.9,color='Gray',
             linetype=3)
lis$plot <- p
lis
summary(lis)
str(lis)
