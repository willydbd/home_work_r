library(tidyverse)
library(dslabs)
data(murders)
murders%>%mutate(murder_rate=total/population*10^5)%>%
  mutate(state=reorder(state,murder_rate))%>%
  ggplot(aes(state,murder_rate))+
  geom_bar(stat="identity")+
  coord_flip()+xlab("")
