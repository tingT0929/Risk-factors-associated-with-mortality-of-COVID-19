###########------------1
load("FIPScumdead.rda")
ss <- var.57[[1]]

ss.possion1 <- ss[, which(colnames(ss)%in%c("FIPS", "cum","dead_15","Population", "Segregation index-non-White/White",
                                            "% Long Commute - Drives Alone", "% Rural","% Drive Alone to Work", "% Hispanic", 
                                            "% With Access to Exercise Opportunities", 
                                            "% Female", "Average Daily PM2.5", "% Insufficient Sleep",
                                            "% 65 and over","Primary Care Physicians Ratio"))]

set.seed(112) 
library(MASS)
library(mpath)
train1 <- sample(1:dim(ss.possion1)[1], dim(ss.possion1)[1]/10*7)
total.mod1 <-  glm.nb(dead_15 ~ ., data = ss.possion1[train1,-which(colnames(ss.possion1)%in%c("FIPS", "cum"))])

summary(total.mod1)
res.11 <- summary(total.mod1)$coefficient

write.csv(res.11[res.11[, "Pr(>|z|)"]<0.05,], file = "class1.csv" ,fileEncoding = "GBK")

Pred1 <- predict(total.mod1, newdata = ss.possion1[-train1,-which(colnames(ss.possion1)%in%c("FIPS", "cum"))], type = "response")

allre <- ss.possion1[-train1, which(colnames(ss.possion1)%in%c("FIPS", "cum", "dead_15"))]
allre$"Pred1" <-Pred1 

quantile(allre[,'dead_15']/allre[,'cum'])

lis.1 <- list(allre, NB=total.mod1)
save(lis.1, file = "class1.rda") #





###########------------2

load("FIPScumdead.rda")
ss <- var.57[[2]]
ss.possion1 <- ss[, which(colnames(ss)%in%c("FIPS", "cum","dead_15","Population", "Segregation index-non-White/White",
                                            "% Long Commute - Drives Alone", "% Rural","% Drive Alone to Work", "% Hispanic", 
                                            "% With Access to Exercise Opportunities", 
                                            "% Female", "Average Daily PM2.5", "% Insufficient Sleep",
                                            "% 65 and over","Primary Care Physicians Ratio"))]


set.seed(2232) #0.02874536
library(MASS)
library(mpath)
train1 <- sample(1:dim(ss.possion1)[1], dim(ss.possion1)[1]/10*7)
total.mod1 <-  glm.nb(dead_15 ~ ., data = ss.possion1[train1,-which(colnames(ss.possion1)%in%c("FIPS", "cum"))])
#total.mod1 <- glmregNB(dead_15 ~ ., alpha=1, data = ss.possion1[train1,-which(colnames(ss.possion1)%in%c("FIPS", "cum"))], lambda=0.21)
#total.mod1 <- glm(dead_15 ~ ., data = ss.possion1[train1,-which(colnames(ss.possion1)%in%c("FIPS", "cum"))], family = poisson)

summary(total.mod1)
res.11 <- summary(total.mod1)$coefficient

write.csv(res.11[res.11[, "Pr(>|z|)"]<0.05,], file = "class2.csv" ,fileEncoding = "GBK")



Pred1 <- predict(total.mod1, newdata = ss.possion1[-train1,-which(colnames(ss.possion1)%in%c("FIPS", "cum"))], type = "response")

allre <- ss.possion1[-train1, which(colnames(ss.possion1)%in%c("FIPS", "cum", "dead_15"))]
allre$"Pred1" <-Pred1 


quantile(allre[,'dead_15']/allre[,'cum'])

lis.1 <- list(allre, NB=total.mod1)
save(lis.1, file = "class2.rda") 


###########------------3


load("FIPScumdead.rda")
ss <- var.57[[3]]

ss.possion1 <- ss[, which(colnames(ss)%in%c("FIPS", "cum","dead_15","Population", "Segregation index-non-White/White",
                                            "% Long Commute - Drives Alone", "% Rural","% Drive Alone to Work", "% Hispanic", 
                                            "% With Access to Exercise Opportunities", 
                                            "% Female", "Average Daily PM2.5", "% Insufficient Sleep",
                                            "% 65 and over","Primary Care Physicians Ratio"))]
set.seed(334)
library(MASS)
library(mpath)
train1 <- sample(1:dim(ss.possion1)[1], dim(ss.possion1)[1]/10*7)
total.mod1 <-  glm.nb(dead_15 ~ ., data = ss.possion1[train1,-which(colnames(ss.possion1)%in%c("FIPS", "cum"))])

summary(total.mod1)
res.11 <- summary(total.mod1)$coefficients
res.11

write.csv(res.11[res.11[, "Pr(>|z|)"]<0.05,], file = "class3.csv" ,fileEncoding = "GBK")

Pred1 <- predict(total.mod1, newdata = ss.possion1[-train1,-which(colnames(ss.possion1)%in%c("FIPS", "cum"))], type = "response")

allre <- ss.possion1[-train1, which(colnames(ss.possion1)%in%c("FIPS", "cum", "dead_15"))]
allre$"Pred1" <-Pred1 

lis.1 <- list(allre,NB=total.mod1)
save(lis.1, file = "class3.rda") 



