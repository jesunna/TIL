#path-ex1

path1 <- read.csv("path1.csv")
head(path1)

model1.1 <- 
  'cmp ~ pos + neg + estm
   estm ~ pos + neg
   pos ~~ neg'
out1.1 <- sem(model1.1, path1)
summary(out1.1, fit.measures=T, standardized=T)


model1.2 <- 
  'cmp ~ estm
   estm ~ pos + neg
   pos ~~ neg'
out1.2 <- sem(model1.2, path1)
summary(out1.2, fit.measures=T, standardized=T)

anova(out1.1, out1.2)


model1.2.med <- 
  'cmp ~ c*estm
   estm ~ b1*pos + b2*neg
   pos ~~ neg
   med1 := b1*c
   med2 := b2*c'
out1.2.med <- sem(model1.2.med, path1, se="bootstrap", bootstrap=1000)
parameterestimates(out1.2.med)




#path-ex2

path2 <- read.csv("path2.csv")
head(path2)

model2 <- 
  'satis ~ a*peer + b4*activ + b5*adjust
   adjust ~ b2*peer + b3*activ
   activ ~ b1*peer
   med_activ := b1*b4
   med_adjust := b2*b5
   med_activ.adjust := b1*b3*b5
   med_total := b1*b4+b2*b5+b1*b3*b5'

out2 <- sem(model2, path2)
summary(out2, fit.measures=T, standardized=T)
out2.boot <- sem(model2, path2, se="bootstrap", bootstrap=1000)
parameterestimates(out2.boot)




#path-ex3

path3.cor <- matrix (c(1, -0.03, 0.39, -0.05, -0.08,
                      -0.03, 1, 0.07, -0.23, -0.16,
                       0.39, 0.07, 1, -0.13, -0.29,
                      -0.05, -0.23, -0.13, 1, 0.34,
                      -0.08, -0.16, -0.29, 0.34, 1), nrow=5, ncol=5)
path3.sd <- c(66.5, 38, 36.8, 67, 62.48)
path3.cov <- cor2cov(path3.cor, path3.sd, names=c("exe", "hard", "fit", "stress", "ill"))


model3.1 <- 
  'ill ~ exe+hard+fit+stress
   stress ~ exe+hard+fit
   fit ~ exe+hard
   exe ~~ hard'
out3.1 <- sem(model3.1, sample.cov=path3.cov, sample.nobs=373)
summary(out3.1, fit.measures=T, standardized=T)


model3.2 <- 
  'ill ~ fit+stress
   stress ~ hard+fit
   fit ~ exe
   exe ~~ 0*hard'
out3.2 <- sem(model3.2, sample.cov=path3.cov, sample.nobs=373)
summary(out3.2, fit.measures=T, standardized=T)

anova(out3.1, out3.2)




