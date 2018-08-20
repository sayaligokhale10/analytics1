mtcars

install.packages("caret")
library(caret)
nrow(mtcars)
#index=createDataPartition(y=mtcars$am,p=0.7, list = F)
index=sample(x=1:nrow(mtcars),size = 0.7*nrow(mtcars))
train= mtcars[index,]
test= mtcars[-index,]
nrow(train)
nrow(test)
nrow(train)+nrow(test)

install.packages("olsrr")
library(olsrr)

fit =lm(mpg~ disp +hp +wt+ qsec, data = train)
k=   ols_step_all_possible(fit)
plot(k)
k
summary(lm(mpg~wt,data = train))
summary(lm(mpg~wt +hp,data = train))


install.packages("gvlma")
library(gvlma)
gvmodel=gvlma(fit)
gvmodel
summary(fit)


finalmodel = (lm(mpg~wt,data = train))
(predictedvalues=predict(finalmodel,ndata=test))
cbind(test$mpg, predictedvalues)



