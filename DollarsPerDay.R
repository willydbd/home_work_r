library(tidyverse)
library(dslabs)
data("gapminder")
gapminder%>%filter(year==1970&!is.na(gdp))%>%
  mutate(dollars_per_day=gdp/population/365)%>%
  ggplot(aes((dollars_per_day)))+
  geom_histogram(aes(fill=..count..),binwidth=1,color="black",show.legend=F)+
  geom_density(col=2)+
  scale_x_continuous(trans="log2")+
  scale_fill_gradient("count",low="green",high="red")

