data1<-read.csv(url("http://stat.columbia.edu/~rachel/datasets/nyt1.csv"))
CTR=(data1$Clicks/data1$Impressions)
> data1$agecat<-cut(data1$Age,c(-1,18,24,34,44,54,64,Inf))
> library(ggplot2)
> ggplot(data1, aes(x=Impressions, fill=agecat))+geom_histogram(binwidth=1)
> ggplot(data1, aes(x=agecat, y=Impressions, fill=agecat))+geom_boxplot()
> data1$imps<-cut(data1$Impressions,c(-1,0,Inf))
> summaryBy(Clicks~imps,data=data1,FUN=c(mean,var,length))
     imps Clicks.mean Clicks.var Clicks.length
1  (-1,0]  0.00000000 0.00000000          3066
2 (0,Inf]  0.09321768 0.09667219        455375
> ggplot(subset(data1,Impressions>0),aes(x=Clicks/Impressions,color=agecat))+geom_density()
> ggplot(subset(data1,Clicks>0),aes(x=Clicks/Impressions,color=agecat))+geom_density()
> ggplot(subset(data1,Clicks>0),aes(x=agecat,y=Clicks,fill=agecat))+geom_boxplot()
> data1$scode[data1$Impressions==0]<-"NoImps"
> data1$scode[data1$Impressions>0]<-"Imps"
> data1$scode[data1$Clicks>0]<-"Clicks"
> data1$scode<-factor(data1$scode)
> head(data1)
  Age Gender Impressions Clicks Signed_In   agecat    imps  scode
1  36      0           3      0         1  (34,44] (0,Inf]   Imps
2  73      1           3      0         1 (64,Inf] (0,Inf]   Imps
3  30      0           3      0         1  (24,34] (0,Inf]   Imps
4  49      1           3      0         1  (44,54] (0,Inf]   Imps
5  47      1          11      0         1  (44,54] (0,Inf]   Imps
6  47      0          11      1         1  (44,54] (0,Inf] Clicks


#click-through rate per gender (excluding 0 Clicks)
qplot(Clicks/Impressions, data=subset(data1, Clicks>0 & Signed_In==1), facets=Gender~., geom="density")

