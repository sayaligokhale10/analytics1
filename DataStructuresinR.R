#DataStructures
#cntrlL to clear
#exelcutes line by line


#vectors ----

v1= 'sayali'
v1
v2 = 1: 100 #creates vector from 1 to 100
v3= c(1,8,23,45)
class(v1)
class(v2)
class(v3)
v4= c(TRUE, FALSE, T, F, T)  #C for combine
class(v4)

#Summary on vectors
mean(v2)
median(v3)
sd(v2)

hist(v2)

hist(women$height)
hist(women$weight)

v3[v3>=20]

x=rnorm(60,mean = 80,sd=10)
x

plot(x)
hist(x)
plot(density(x))
abline(v=80)


#rectangles and density together
hist(x, freq = T) #freq false
lines(density(x))

hist(x, breaks =10, col=1:10)

length(x)

boxplot(x)
sd(x)

?sample

x1=letters[5:20]


set.seed(1234)  #we can repeat the sequence. we neet to run seed each time before sampling
y1=sample(x1)
x1
y1

set.seed(1233)
(y2=sample(x1,size = 5))

(gender=sample(c('M','F'),size = 60000000,replace = T,prob = c(0.1,0.9)))
t1=table(gender)
prop.table(t1)  #gives %

pie(t1)
barplot(t1, col = 1:2, horiz = F)


#Matrix----

(m1= matrix(1:24, nrow = 4,ncol = 6))
class(m1)
(m2= matrix(1:24, nrow = 4,byrow = T))  #default byrow=f

(m1= matrix(1:2, nrow = 4,ncol = 2))
(x=runif(60,60,100))
?runif
plot(density(x))
(x=trunc(runif(60,60,100)))
(m4=matrix(x,ncol = 10))
colSums(m4)
rowSums(m4)
rowMeans(m4)
colMeans(m4)
m4[m4>67 & m4<90 ]
m4[,5:9]
m4 [4:6,c(1,8,10)]
rowSums(m4[4:6,c(1,8,10)])


#array----









#data frame ----

#rollno stud name, gender, course , marks1, marks2, grades
(rollno = 1:60)
(name=paste('student1',1:60,sep = '-'))
name [9:12]
name[c(15,20,37)]
name[-c(1:10)]

name[19:12]
rev(name)
(gender=sample(c('M','F'),size = 60,replace = T,prob = c(0.45,0.55)))
(course=sample(c('bba','mba','fpm'),size = 60,replace = T,prob = c(0.2,0.7,0.1)))
(marks1= ceiling(rnorm(60,mean = 45,sd = 18)))
(marks2= ceiling(rnorm(60,mean = 50,sd = 8)))
(grades=sample(c('A','B','C'),size = 60,replace = T))

Students =data.frame(rollno,name,gender,course,marks1,marks2,grades, stringsAsFactors = F)
View(Students)
class(Students)
summary(Students)
Students[Students$gender=='M',c('rollno','course')]

Students[Students$marks1 >=50 & Students$marks2 >=60,]
Students[(Students$marks1 >=50 & Students$marks2 <=10)| grades=='A' & course=='bba',]

(Students[(Students$marks1 >=50 & Students$marks2 <=10)| grades=='A' & course=='bba',])
barplot(table(Students$grades),ylim = c(0,30),col = 1:3)
text(1:3,table(Students$grades)+1, table(Students$grades))

str(Students)
nrow(Students)
names(Students)
dim(Students)
head(Students) #first 6 records
tail(Students)
head(Students,n=2)

Students[10:12 & (Students$marks1>40),]  #???????

aggregate(Students$marks1, by = list(Students$gender), FUN=mean)
aggregate(Students$marks2, by = list(Students$course), FUN=max)
aggregate(Students$marks2, by = list(Students$gender,Students$course), FUN=mean)

aggregate(Students$marks2, by = list(Students$gender,Students$course=='bba'), FUN=mean)


#paste('IIM'  paste('student1',1:60,sep = '-'),1:60,sep = '*') nested paste



#load library

library(dplyr)

Students %>% group_by(gender) %>% summarise((mean(marks1)))
Students %>% group_by(course,gender) %>% summarise(meanM1=mean(marks1),max(marks2)) %>%arrange(desc(meanM1)) 

Students %>% arrange(desc(marks1+marks2))  %>%filter(gender=='F') %>%sample_n(5) %>% select (rollno,gender,course,marks1,marks2,grades)


#sample_frac()  sample_n()

Students%>% sample_frac(0.1,replace = F)
Students %>% sample_n(replace = F,weight = NULL, .env = NULL,size = 4) %>% arrange(course)


## 
Students$gender=factor(Students$gender)
summary(Students$gender)

Students$course=factor(Students$course)
Students$course=factor(Students$course, ordered = T, levels = c('bba', 'mba', 'fpm'))
summary(Students$course)


#C, A, B   C<A<B

Students$grades=factor(Students$grades, ordered=T ,levels = c('C','A','B'))
Students$grades
table(Students$grades)
barplot(table(Students$grades))



write.csv(Students,'./data/iimtrichy.csv')
Students2=read.csv('./data/iimtrichy.csv')
Students3= read.csv(file.choose())

Students3=Students3[,-1]

Students3

head(Students2)



