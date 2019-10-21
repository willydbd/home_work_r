library(tidyverse)
library(dslabs)
data("gapminder")
gapminder%>%filter(year==1970&!is.na(gdp))%>%
  mutate(dollars_per_day=gdp/population/365)%>%
  mutate(region=reorder(region,dollars_per_day,FUN=median))%>%
    ggplot(aes(region,dollars_per_day, fill=continent))+
  geom_boxplot()+
  theme(axis.text.x =element_text(angle=60,hjust=1))+
  xlab("Region")+scale_fill_discrete("Continent")+
  scale_y_continuous(trans="log2")+
  geom_point(show.legend=F)
  