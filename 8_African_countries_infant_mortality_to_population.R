library(tidyverse)
library(ggrepel)
library(ggthemes)
library(dslabs)
data("gapminder")
gapminder%>%filter(year%in%c(1960,1972,1983,1999,
                             2015)&
  country%in%c("Algeria","Nigeria","Tunisia","Ethiopia",
               "Botswana","South Africa","Rwanda",
               "Ghana"))%>%
  ggplot(aes(population/10^6,infant_mortality,label=country))+
  geom_point(aes(col=region))+geom_text_repel()+
  facet_wrap(.~year)
