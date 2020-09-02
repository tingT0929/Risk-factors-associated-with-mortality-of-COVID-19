# ------------- Packages ---------------
library(clusterCrit)
library(ggplot2)
library(data.table)
library(cluster)

# ------------- Functions ---------------
norm_z <- function(x) {
  nx <- (x - mean(x)) / norm(x - mean(x), type = "2")
}

# ------------- Clustering ---------------
load("Data/cum_confirm_3208.rda")
ter.data <- cum_confirm_3208
cum_confirm_n <- apply(ter.data, 2, norm_z)
colnames(cum_confirm_n) <- seq(1, 180, length.out = 180)
rownames(cum_confirm_n) <- rownames(ter.data) 

# using PAM method to cluster the cumulative cases from 03/01 to 08/27 
clusterings <- lapply(c(2:7), function(x)
  pam(cum_confirm_n, x))
BH_values <- sapply(seq_along(clusterings), function(x) 
  intCriteria(cum_confirm_n, as.integer(clusterings[[x]]$clustering),
              c("Ball_Hall")
  ))

# plot the results and select the best one
ggplot(data.table(Clusters = 2:7, BH_index = unlist(BH_values)),
       aes(Clusters, BH_index)) +
  geom_line(size = 1) +
  geom_point(size = 3) +
  theme_bw()
