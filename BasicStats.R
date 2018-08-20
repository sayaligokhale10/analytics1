#basic stats

x= ceiling(rnorm(10000,mean = 60,sd = 20))
mean(x)
median(x)


#no mode function for mode stats

table(x)
sort (table(x),decreasing = T)

install.packages("modeest")
library(modeest)

mlv(x,method = 'shorth')
quantile(x)
quantile(x,seq(.1,1,by = 0.1))  #decile
quantile(x,seq(0.01,1, by = 0.01)) #percentile

install.packages("e1071")
library(e1071)

plot(density(x))

e1071::skewness(x)
kurtosis(x)

sd(x)
var(x)
cov(women$height,women$weight)
cov(women$weight,women$height)

stem(x)

#Freq Tables
install.packages("fdth")
library(fdth)
ftable1=fdt(x)
ftable1


