library(tidyverse)
library(dslabs)
library(ggrepel)
data(gapminder)
countries<-c("Egypt","Nigeria","Tunsia","South Africa",
             "Rwanda","Botswana","Ethiopia",
             "Swaziland","Seychelles","Ghana",
             "Mauritius")
gapminder%>%filter(year%in%c(2010,2015)&
                     country%in%countries)%>%
  mutate(location=ifelse(year==2010,1,2),
         location=ifelse(year==2015&country=="Ghana",location+0.22,location),
hjust=ifelse(year==2010,1,0),
vjust=ifelse(country=="Seychelles",1.5,0))%>%
  mutate(year=as.factor(year))%>%
  ggplot(aes(year,life_expectancy,group=country))+
  geom_line(aes(col=country),show.legend=F)+
  geom_text(aes(x=location,label=country,hjust=hjust,vjust=vjust))+
  labs(x=(""),y=("Life Expectancy"))