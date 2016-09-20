# changing column names in a matrix/dataframe
colnames(x) <- c("CD163","CD206","CD14","CD64","CD11b","CD33")

# c nxn plot essentially
pairs(x)

# PCA plot calculations
PCA1 <- princomp(x, scores = TRUE, cor = TRUE)


PCA2<- factanal(x = x, factors = 3)