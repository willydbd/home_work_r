library(tidyverse)
library(dslabs)
data("gapminder")
west<-c("Northern America","Northern Europe",
        "Western Europe","Australia and New Zealand")
gapminder%>%filter(year%in%c(1970,2010)&!is.na(gdp))%>%
  mutate(group=ifelse(region%in%west,"West","Developing"))%>%
  mutate(dollars_per_day=gdp/population/365)%>%
  ggplot(aes(dollars_per_day))+
  geom_histogram(binwidth=1,col="black")+
  scale_x_continuous(trans="log2")+
  facet_grid(year~group)+
  ggtitle("The West vs The Rest Of The World View")