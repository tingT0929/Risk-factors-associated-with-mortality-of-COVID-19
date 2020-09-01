norm_z<-function(x){
  nx=(x-mean(x))/norm(x-mean(x),type ="2" )
}

library(clusterCrit)
library(ggplot2)
library(data.table)
library(cluster)

load("cum_confirm.rda")
ter.data=cum_confirm[-which(cum_confirm[,46]==0),]
cum_confirm_n <- apply(ter.data, 2, norm_z)
colnames(cum_confirm_n) <- seq(1,46, length.out = 46)
rownames(cum_confirm_n) <- rownames(ter.data) 

# clustering
clusterings <- lapply(c(2:7), function(x)
  pam(cum_confirm_n, x))
KD_values <- sapply(seq_along(clusterings), function(x) 
  intCriteria(cum_confirm_n, as.integer(clusterings[[x]]$clustering),
              c("Ksq_DetW")
  ))
# plot the results
ggplot(data.table(Clusters = 2:7, KD_index = unlist(KD_values)),
       aes(Clusters, KD_index)) +
  geom_line(size = 1) +
  geom_point(size = 3) +
  theme_bw()




