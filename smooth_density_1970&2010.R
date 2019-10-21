library(tidyverse)
library(dslabs)
data("gapminder")
past_year<-1970
present_year<-2010
gapminder<-gapminder%>%mutate(dollars_per_day=gdp/population/365)

country_list_1<-gapminder%>%filter(year==past_year&
                                     !is.na(dollars_per_day))%>%
  .$country
country_list_2<-gapminder%>%filter(year==present_year&
                                     !is.na(dollars_per_day))%>%
  .$country
country_list<-intersect(country_list_1,country_list_2)

west<-c("Northern America","Northern Europe","Southern Europe",
        "Western Europe","Australia and New Zealand")

gapminder%>%filter(year%in%c(past_year,present_year)&country%in%country_list)%>%
  mutate(group=case_when(.$region%in%west~"West",
                         .$region%in%c("Eastern Asia","South-Eastern Asia")~"East Asia",
                         .$region%in%c("South America","Central America","Caribbean")~"Latin America",
                         .$continent=="Africa"&.$region!="Northern Africa"~"Sub-Sahara Africa",
                         TRUE~"Others"
                         )
           )%>%
  mutate(group=factor(group,levels=c("Others","Latin America",
                                     "East Asia","Sub-Sahara Africa",
                                     "West")))%>%
    ggplot(aes(dollars_per_day,..count..,fill=group))+
      geom_density(alpha=0.2,bw=0.7,position="stack")+
  scale_x_continuous(trans="log2")+
  facet_grid(year~.)+
  ggtitle("The West vs The Rest Of The World View")