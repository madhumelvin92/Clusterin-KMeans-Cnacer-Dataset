library("readr")
library(ClusterR)
library(cluster)
library(factoextra)
path <- "C:/Users/madhu/OneDrive/Documents/breast_cancer.csv"

# reading contents of csv file
content <- read_csv(path, col_names = TRUE)

# contents of the csv file
View(content)

#stripping off the last column(class label)
df=content[0:5]

set.seed(120)
#K-means implementation with k=2 clusters
kmeans.re <- kmeans(df, centers = 2, nstart = 2)
kmeans.re
#Confusion Matrix
cm<-table(content$diagnosis,kmeans.re$cluster)
cm
#Find the accuracy of the k-means algorithm clusters against the actual class labels
accuracy<-sum(diag(cm))/sum(cm)
accuracy
par(mar = c(1, 1, 1, 1))

#visualising the clusters
fviz_cluster(kmeans.re, data = df,
             palette = c("#2E9FDF", "#00AFBB", "#E7B800"), 
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_bw()
)

