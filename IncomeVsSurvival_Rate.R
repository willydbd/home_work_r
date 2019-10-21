library(tidyverse)
library(dslabs)
data("gapminder")
past_year<-1970
present_year<-2010

west<-c("Northern America","Northern Europe","Southern Europe",
        "Western Europe","Australia and New Zealand")

surv_income<-gapminder%>%mutate(group=case_when(.$region%in%west~"The West",
                                                .$region%in%c("Eastern Asia","South-Eastern Asia")~"East Asia",
                                                .$region%in%c("South America","Central America","Caribbean")~"Latin America",
                                                .$region%in%"Northern Africa"~"North Africa",
                                                .$region%in%c("Melanesia","Micronesia","Ploynesia")~"pacific Islands",
                                                .$continent=="Africa"&.$region!="Northern Africa"~"Sub-Sahara Africa",
                                                .$region=="SOuthern Asia"~"South Asia"))%>%
filter(year%in%present_year&!is.na(gdp)&!is.na(infant_mortality)&!is.na(group))%>%
group_by(group)%>%
summarize(income=sum(gdp)/sum(population)/365,
            infant_survival_rate=1-sum(infant_mortality/1000*population)/sum(population))
surv_income%>%ggplot(aes(income,infant_survival_rate,label=group,color=group))+
  geom_label(show.legend=F)+
scale_x_continuous()
  
