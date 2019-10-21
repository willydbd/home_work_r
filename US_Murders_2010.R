library(tidyverse)
library(ggrepel)
library(ggthemes)
library(dslabs)
data(murders)
##define slope
r<-murders%>%summarise(rate=sum(total)/sum(population)*10^6)%>%.$rate
##plot graph
murders%>%ggplot(aes(population/10^6,total,label=abb))+
geom_point(aes(col=region),size=3)+
geom_text_repel(size=3)+
scale_x_log10()+
scale_y_log10()+
geom_abline(intercept=log10(r),lty=2,color="darkgrey")+
xlab("Population in Millions (log scale)")+
ylab("Total number of murders (log scale)")+
ggtitle("US Gun Murders in US 2010")+
scale_color_discrete("Region")+
theme_economist()