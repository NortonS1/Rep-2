 # scatter plot
 plot(log10(X..V_450_50.A.), log10(X..B_710_50.A.), x, type = "p")
 
 # normalisation (the ,2, in apply means columns, ,1, would mean rows)
 apply(x,2,mean) -> m
 apply(x,2,sd) -> s
 scale(x,m,s) -> xs
 
 # calculating euclidean distance
 dist(xs) -> distance
 
 # reducing digits shown
 print(x,digits = 3)
 
 #  cluster dendrogram with complete linkage 
 # hang aligns the clusters at the bottom
 hclust(distance) -> hc.c
 plot(hc.c, hang = -1)
 
 # Cluster membership
 cutree(hc.c,50) -> member.c

 # Cluster means
 aggregate(xs, list(member.c), mean) -> clusters

# silhouette plot
 
 plot(silhouette(cutree(hc.c,8), distance))
 
 # How to calculate how many cllusters to form (within group sum of squares for each number of clusters)
 # i is all of the values in the vector so "for i in 2:20" it means do something for 2-20 times.
 
 wss <- (nrow(xs[c(1:40),])-1)*sum(apply((xs[c(1:40),]),2,var))
 for (i in 2:20) wss[i] <- sum(kmeans((xs[c(1:40),]), centers=i)$withinss)
 plot(1:20, wss, type = "b")
 
 #  K-means clustering, non-hierarchical (kc$any component gives you that components as a value)
 
 kmeans(xs[c(200:240),c(1:5)], 8) -> kc
kc$centers

plot( log10(V_450_50.A)~log10(B_710_50.A), x, col=kc$cluster)

# subsetting matrices (this takes row 5 from a matrix)
y[5,,drop = FALSE] -> y5

# plotting specific clusters (5 in this case) for all markers assessed using kmeans
boxplot.matrix(xs[kc$cluster == 5,], cex = 1, xlab = ("Parameters"), cex.lab = 2,col.lab = "firebrick2")

plot(hc.c, hang = -1)
color_branches(hc.c, k = 10)