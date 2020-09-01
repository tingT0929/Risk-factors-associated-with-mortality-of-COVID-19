# ------------- Packages ---------------
library(MASS)
library(mpath)

# ------------- Part I -----------------
# ----- load data
load("Data/FIPScumdead.rda")
ss <- var.57[[1]]
ss.possion1 <- ss[, which(colnames(ss) %in% 
                            c("FIPS", "cum","dead_15","Population", "Segregation index-non-White/White",
                              "% Long Commute - Drives Alone", "% Rural","% Drive Alone to Work", 
                              "% Hispanic", "% With Access to Exercise Opportunities", 
                              "% Female", "Average Daily PM2.5", "% Insufficient Sleep",
                              "% 65 and over","Primary Care Physicians Ratio"))]

# set.seed(112) 
# ----- fit model
train1 <- sample(1:dim(ss.possion1)[1], dim(ss.possion1)[1] / 10 * 7)
total.mod1 <-  glm.nb(dead_15 ~ ., data = ss.possion1[train1, -which(colnames(ss.possion1) %in% c("FIPS", "cum"))])
summary(total.mod1)
res.11 <- summary(total.mod1)$coefficient

write.csv(res.11[res.11[, "Pr(>|z|)"] < 0.05, ], file = "Result/class1.csv" , fileEncoding = "GBK")

Pred1 <- predict(total.mod1, newdata = ss.possion1[-train1,-which(colnames(ss.possion1)%in%c("FIPS", "cum"))], type = "response")

allre <- ss.possion1[-train1, which(colnames(ss.possion1) %in% c("FIPS", "cum", "dead_15"))]
allre$"Pred1" <- Pred1 

quantile(allre[,'dead_15'] / allre[,'cum'])

lis.1 <- list(allre, NB = total.mod1)
save(lis.1, file = "Result/class1.rda") 


# ------------- Part II -----------------
load("Data/FIPScumdead.rda")
ss <- var.57[[2]]
ss.possion1 <- ss[, which(colnames(ss) %in% 
                            c("FIPS", "cum","dead_15","Population", "Segregation index-non-White/White",
                              "% Long Commute - Drives Alone", "% Rural","% Drive Alone to Work", 
                              "% Hispanic", "% With Access to Exercise Opportunities", 
                              "% Female", "Average Daily PM2.5", "% Insufficient Sleep",
                              "% 65 and over","Primary Care Physicians Ratio"))]

# set.seed(2232)
# ----- fit model
train1 <- sample(1:dim(ss.possion1)[1], dim(ss.possion1)[1] / 10 * 7)
total.mod1 <-  glm.nb(dead_15 ~ ., data = ss.possion1[train1, -which(colnames(ss.possion1) %in% c("FIPS", "cum"))])
summary(total.mod1)
res.11 <- summary(total.mod1)$coefficient

write.csv(res.11[res.11[, "Pr(>|z|)"] < 0.05, ], file = "Result/class2.csv", fileEncoding = "GBK")

Pred1 <- predict(total.mod1, newdata = ss.possion1[-train1, -which(colnames(ss.possion1) %in% c("FIPS", "cum"))], type = "response")

allre <- ss.possion1[-train1, which(colnames(ss.possion1) %in% c("FIPS", "cum", "dead_15"))]
allre$"Pred1" <- Pred1 

quantile(allre[, 'dead_15'] / allre[, 'cum'])

lis.1 <- list(allre, NB = total.mod1)
save(lis.1, file = "Result/class2.rda") 


# ------------- Part III -----------------
# load("Data/FIPScumdead.rda")
ss <- var.57[[3]]

ss.possion1 <- ss[, which(colnames(ss) %in%
                            c("FIPS", "cum","dead_15","Population", "Segregation index-non-White/White",
                              "% Long Commute - Drives Alone", "% Rural","% Drive Alone to Work", 
                              "% Hispanic", "% With Access to Exercise Opportunities", 
                              "% Female", "Average Daily PM2.5", "% Insufficient Sleep",
                              "% 65 and over","Primary Care Physicians Ratio"))]
# set.seed(334)
# ----- fit model
train1 <- sample(1:dim(ss.possion1)[1], dim(ss.possion1)[1] / 10 * 7)
total.mod1 <-  glm.nb(dead_15 ~ ., data = ss.possion1[train1, -which(colnames(ss.possion1) %in% c("FIPS", "cum"))])
summary(total.mod1)
res.11 <- summary(total.mod1)$coefficients

write.csv(res.11[res.11[, "Pr(>|z|)"] < 0.05, ], file = "Result/class3.csv", fileEncoding = "GBK")

Pred1 <- predict(total.mod1, newdata = ss.possion1[-train1, -which(colnames(ss.possion1) %in% c("FIPS", "cum"))], type = "response")

allre <- ss.possion1[-train1, which(colnames(ss.possion1) %in% c("FIPS", "cum", "dead_15"))]
allre$"Pred1" <-Pred1 

lis.1 <- list(allre,NB = total.mod1)
save(lis.1, file = "Result/class3.rda") 
