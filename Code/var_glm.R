# ------------- Packages ---------------
library(MASS)
library(mpath)

# ------------- Cluster I -----------------
# ----- load data
load("Data/cluster_var.rda")
ss <- cluster.var[[1]]
ss.possion1 <- ss[, which(colnames(ss) %in% 
                            c("dead","Population", "Segregation index-non-White/White",
                              "% Long Commute - Drives Alone", "% Rural","% Drive Alone to Work", 
                              "% Hispanic", "% With Access to Exercise Opportunities", 
                              "% Female", "Average Daily PM2.5", "% Insufficient Sleep",
                              "% 65 and over","Primary Care Physicians Ratio"))]

# ----- fit model
set.seed(1111)
train1 <- sample(1:dim(ss.possion1)[1], dim(ss.possion1)[1] / 10 * 7)
total.mod1 <-  glm.nb(dead ~ ., data = ss.possion1[train1, ])
summary(total.mod1)
res.11 <- summary(total.mod1)$coefficient

write.csv(res.11[res.11[, "Pr(>|z|)"] < 0.05, ], file = "Result/class1.csv", fileEncoding = "GBK")

Pred1 <- predict(total.mod1, newdata = ss.possion1[-train1,], type = "response")

allre <- ss.possion1[-train1, ]
allre$"Pred1" <- Pred1 


lis.1 <- list(allre, NB = total.mod1)
save(lis.1, file = "Result/class1.rda") 


# ------------- Cluster II -----------------
ss <- cluster.var[[2]]
ss.possion1 <- ss[, which(colnames(ss) %in% 
                            c("dead","Population", "Segregation index-non-White/White",
                              "% Long Commute - Drives Alone", "% Rural","% Drive Alone to Work", 
                              "% Hispanic", "% With Access to Exercise Opportunities", 
                              "% Female", "Average Daily PM2.5", "% Insufficient Sleep",
                              "% 65 and over","Primary Care Physicians Ratio"))]

# ----- fit model
set.seed(1111)
train1 <- sample(1:dim(ss.possion1)[1], dim(ss.possion1)[1] / 10 * 7)
total.mod1 <- glm.nb(dead ~ ., data = ss.possion1[train1, ])
summary(total.mod1)
res.11 <- summary(total.mod1)$coefficient

write.csv(res.11[res.11[, "Pr(>|z|)"] < 0.05, ], file = "Result/class2.csv", fileEncoding = "GBK")

Pred1 <- predict(total.mod1, newdata = ss.possion1[-train1, ], type = "response")

allre <- ss.possion1[-train1, ]
allre$"Pred1" <- Pred1 


lis.1 <- list(allre, NB = total.mod1)
save(lis.1, file = "Result/class2.rda") 


# ------------- Cluster III -----------------
ss <- cluster.var[[3]]

ss.possion1 <- ss[, which(colnames(ss) %in%
                            c("dead","Population", "Segregation index-non-White/White",
                              "% Long Commute - Drives Alone", "% Rural","% Drive Alone to Work", 
                              "% Hispanic", "% With Access to Exercise Opportunities", 
                              "% Female", "Average Daily PM2.5", "% Insufficient Sleep",
                              "% 65 and over","Primary Care Physicians Ratio"))]

# ----- fit model
set.seed(1111)
train1 <- sample(1:dim(ss.possion1)[1], dim(ss.possion1)[1] / 10 * 7)
total.mod1 <-  glm.nb(dead ~ ., data = ss.possion1[train1, ])
summary(total.mod1)
res.11 <- summary(total.mod1)$coefficients

write.csv(res.11[res.11[, "Pr(>|z|)"] < 0.05, ], file = "Result/class3.csv", fileEncoding = "GBK")

Pred1 <- predict(total.mod1, newdata = ss.possion1[-train1, ], type = "response")

allre <- ss.possion1[-train1, ]
allre$"Pred1" <- Pred1 

lis.1 <- list(allre,NB = total.mod1)
save(lis.1, file = "Result/class3.rda") 
