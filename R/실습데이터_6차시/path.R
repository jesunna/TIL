#data import

data1 <- read.csv(file.choose())
data1 <- read.csv("data1.csv")
str(data1)
head(data1)


#install lavaan, semPlot

install.packages("lavaan", dependencies=T)
library(lavaan)


#model analysis

path.model <- 
  'lifesat_m ~ friend_m + selfest_m
   selfest_m ~ friend_m'
path.out <- sem(path.model, data1)
summary(path.out, fit.measures=T, standardized=T)


#Cf-variance of exogenous observed variable
path.out <- sem(path.model, data1, fixed.x=F)
summary(path.out, fit.measures=T, standardized=T)

path.model <- 
  'lifesat_m ~ friend_m + selfest_m
   selfest_m ~ friend_m
   friend_m ~~ friend_m'
path.out <- sem(path.model, data1, meanstructure=F)
summary(path.out, fit.measures=T, standardized=T)


#mediation effect

path.model.med <- 
  'lifesat_m ~ a*friend_m + c*selfest_m
   selfest_m ~ b*friend_m
   med := b*c
   total := a+b*c'

set.seed(123)
path.out.med <- sem(path.model.med, data1, se="bootstrap", bootstrap=1000)
summary(path.out.med, fit.measures=T, standardized=T)
parameterestimates(path.out.med)


#model comparison
path.model <- 
   'lifesat_m ~ friend_m + selfest_m
   selfest_m ~ friend_m'
path.out <- sem(path.model, data1)

path.model.re <- 
  'lifesat_m ~ selfest_m
   selfest_m ~ friend_m'
path.out.re <- sem(path.model.re, data1)
summary(path.out.re, fit.measures=T, standardized=T)

anova(path.out, path.out.re)


#plot

install.packages("semPlot", dependencies=T)
library(semPlot)

semPaths(path.out)
semPaths(path.out, style="lisrel")
semPaths(path.out, style="lisrel", sizeMan=10, rotation=2) 



