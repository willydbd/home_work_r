library(tidyverse)
library(ggrepel)
library(ggthemes)
library(dslabs)
data("gapminder")
countries<-c("Nigeria","Ethiopia")
labels<-data.frame(country=countries,x=c(1970,1965),y=c(175,140))
gapminder%>%filter(country%in%countries,!is.na(infant_mortality))%>%
    ggplot(aes(year,infant_mortality,col=country))+
  geom_line()+geom_text(data=labels,aes(x,y,label=country))+
  theme(legend.position = "none")
