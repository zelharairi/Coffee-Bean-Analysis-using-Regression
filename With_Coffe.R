# --- LOADING THE DATA ---
fp = "Coffee_Chain_Sales.csv"

df <- read.csv(fp)

drops <- c("Area.Code","State","Type")
df <- df[ , !(names(df) %in% drops)]



#Lets try product categories
df$Product_type_colors <- 
df$Product_type == 'Green Tea' , "blue"

df$Market_colors <- ifelse( 
  df$Market == 'South' , "blue", ifelse(
    df$Market == 'Central' , "orange", ifelse(
      df$Market == 'East' , "green", "gold" ) 
  )
)

df_2 <- subset(df, Market == 'Central' )
dim(df_2)
pairs(df_2[,c(8,12)], Product_type == 'Green Tea')

numerical_variables <-c(1,5,8,13,14,15,16)
categorical_variables <- c(3,6,7,9,10,11,19,20)


boxplot(record_center,  col='gold', main='Standardized variables')


record_center = scale(df_2[,c(numerical_variables,12)], center = TRUE, scale = TRUE)
boxplot(record_center,  col='gold', main='Standardized variables')
quartiles <- boxplot(record_center,  col='gold', main='Standardized variables')$stats[,8]
boxplot(df_2[,c(numerical_variables,12)])$stats[,8]
quartiles
  
record_center_df <- as.data.frame(record_center)

df_profit_outliers <- as.matrix( subset(record_center_df, 2.2636550< Profit) )
df_2_outliers <- as.matrix( subset(df_2, 233 <= Profit) )
dim(df_profit_outliers)
dim(df_2_outliers)


matlines(1:8,df_profit_outliers[1,])
matlines(1:8,df_profit_outliers[2,])
matlines(1:8,df_profit_outliers[3,])
matlines(1:8,df_profit_outliers[4,])
matlines(1:8,df_profit_outliers[5,])
matlines(1:8,df_profit_outliers[6,])
matlines(1:8,df_profit_outliers[7,])
matlines(1:8,df_profit_outliers[8,])
matlines(1:8,df_profit_outliers[9,])
matlines(1:8,df_profit_outliers[10,])
matlines(1:8,df_profit_outliers[11,])



df_profit_no_outliers <- subset(record_center_df, 2.2636550> Profit)
df_2_no_outliers <- as.matrix( subset(df_2, 233 > Profit) )

pairs(df_profit_no_outliers)




# --- PCA ---
myPr <- prcomp(df_2[,numerical_variables], scale = TRUE)
myPr     

summary(myPr)
plot(myPr, type = "l")
# scree plot
# points are the observations with it's values in PC1 and PC2
# the red lines are the eigenvectors for each variable
# helps interpret the relationships between observations and the PCs
biplot(myPr, scale = 0)

# -- EXTRACT PC SCORES --
#score on every observation
myPr$x
pizza2 <- cbind(df_2, myPr$x[,1:2])
head(pizza2)



### ----------------------- FROM HERE !!!!

#x11()

min_calories <- min(pizza2$Profit)
max_calories <- max(pizza2$Profit)

# Create breaks for categorization
breaks <- seq(min_calories, max_calories, length.out = 7)

# Create a new column 'calories_category' in 'pizza2' based on breaks
pizza2$calories_category <- cut(pizza2$Profit, breaks = breaks, labels = FALSE, include.lowest = TRUE)

custom_colors <- c("red", "orange", "yellow", "green", "blue","gold","purple")
pizza2$calories_color <- custom_colors[cut(pizza2$Profit, breaks = breaks, labels = FALSE, include.lowest = TRUE)]

unique(pizza2$calories_color)

which(is.na(pizza2$PC1), arr.ind=TRUE) 
which(is.na(pizza2$PC2), arr.ind=TRUE) 


min(pizza2$PC1)
max(pizza2$PC1)
min(pizza2$PC2)
max(pizza2$PC2)


n <- dim(pizza2)[1]
p <- dim(pizza2)[2]

layout(cbind(c(2,4), c(1,3)), widths = c(1,4), heights = c(4, 1))
par(mar=rep(3,4))
plot(pizza2[,21:22], col=pizza2$calories_color, pch=19, xlim=c(-5,10), ylim=c(-5,5), las=2)
#abline(h=-3, v=-16, col=1)
points(pizza2[,21], rep(-5, n), col=pizza2$calories_color, pch=19)
points(rep(-4, n),pizza2[,22], col=pizza2$calories_color, pch=19)
abline(h=0, v=0, lty=2, col='grey')
boxplot(pizza2[,22]~ pizza2$calories_category, col=custom_colors, ylim=c(-5,5), las=2)
boxplot(pizza2[,21]~ pizza2$calories_category, col=custom_colors, ylim=c(-5,10), horizontal=T, las=2)

graphics.off()

#Now with only 3 categories:

# Create breaks for categorization
breaks <- seq(min_calories, max_calories, length.out = 4)

# Create a new column 'calories_category' in 'pizza2' based on breaks
pizza2$calories_category <- cut(pizza2$Profit, breaks = breaks, labels = FALSE, include.lowest = TRUE)

custom_colors <- c("green", "orange", "purple", "red", "blue","gold","yellow")
pizza2$calories_color <- custom_colors[cut(pizza2$Profit, breaks = breaks, labels = FALSE, include.lowest = TRUE)]

unique(pizza2$calories_color)

which(is.na(pizza2$PC1), arr.ind=TRUE) 
which(is.na(pizza2$PC2), arr.ind=TRUE) 


min(pizza2$PC1)
max(pizza2$PC1)
min(pizza2$PC2)
max(pizza2$PC2)


n <- dim(pizza2)[1]
p <- dim(pizza2)[2]

layout(cbind(c(2,4), c(1,3)), widths = c(1,4), heights = c(4, 1))
par(mar=rep(3,4))
plot(pizza2[,21:22], col=pizza2$calories_color, pch=19, xlim=c(-5,10), ylim=c(-5,5), las=2)
#abline(h=-3, v=-16, col=1)
points(pizza2[,21], rep(-5, n), col=pizza2$calories_color, pch=19)
points(rep(-4, n),pizza2[,22], col=pizza2$calories_color, pch=19)
abline(h=0, v=0, lty=2, col='grey')
boxplot(pizza2[,22]~ pizza2$calories_category, col=custom_colors, ylim=c(-5,5), las=2)
boxplot(pizza2[,21]~ pizza2$calories_category, col=custom_colors, ylim=c(-5,10), horizontal=T, las=2)

graphics.off()

layout(cbind(c(2,4), c(1,3)), widths = c(1,4), heights = c(4, 1))
par(mar=rep(3,4))
plot(pizza2[,21:22], col=pizza2$calories_color, pch=19, xlim=c(-5,10), ylim=c(-5,5), las=2)
#abline(h=-3, v=-16, col=1)
points(pizza2[,21], rep(-5, n), col=pizza2$calories_color, pch=19)
points(rep(-4, n),pizza2[,22], col=pizza2$calories_color, pch=19)
abline(h=0, v=0, lty=2, col='grey')
boxplot(pizza2[,22]~ pizza2$Product_type, col=custom_colors, ylim=c(-5,5), las=2)
boxplot(pizza2[,21]~ pizza2$Product_type, col=custom_colors, ylim=c(-5,10), horizontal=T, las=2)

graphics.off()




## Second graph

layout(matrix(c(1,2),2))
boxplot(pizza2[numerical_variables],  col='gold', main='Standardized variables')
boxplot(myPr$x,  col='gold', main='Principal components')


graphics.off()

# -- Zizo
library(ggplot2)

ggplot(pizza2, aes(PC1, PC2, col = Market_size, fill = Market_size)) +
  stat_ellipse(geom = 'polygon', col = "black", alpha = 0.5) +
  geom_point(shape = 21, col = "black")

# --- CORRELATIONS BETWEEN VARS AND PCS ---
cor(df[,categorical_variables], record_center_df[,1:7])


# --- CLASS EXAMPLE ---

pizza.label <- df[,1:2]
pizza <- df[,(3:8)]
head(df)
head(pizza2)
n <- dim(pizza)[1]
p <- dim(pizza)[2]

pizza.sd <- scale(pizza)
pizza.sd <- data.frame(pizza.sd)

head(pizza.sd)

pairs(pizza.sd)

pc.pizza <- princomp(pizza.sd, scores=T) #PCA ON Dataframe tourists.sd and returning the score weights T
pc.pizza
summary(pc.pizza)

# -- Explained Variance of PCAs graphs
layout(matrix(c(2,3,1,3),2,byrow=T))
plot(pc.pizza, las=2, main='Principal Components', ylim=c(0,7))
abline(h=1, col='blue')
barplot(sapply(pizza.sd,sd)^2, las=2, main='Original Variables', ylim=c(0,8), ylab='Variances')
plot(cumsum(pc.pizza$sde^2)/sum(pc.pizza$sde^2), type='b', axes=F, xlab='Number of components', ylab='Contribution to the total variance', ylim=c(0,1))
box()
axis(2,at=0:10/10,labels=0:10/10)
axis(1,at=1:ncol(pizza.sd),labels=1:ncol(pizza.sd),las=2)

# Scatterplot matrix
pairs(pizza, las=2, pch=19)
scatterplot3d(pizza2[,10],pizza2[,11],pizza2[,9], main="3D Scatterplot", xlab = "PC1", ylab = "PC2", zlab = "Calories")

# -- Loadings
names(pc.pizza)

# loadings
load.slices <- pc.pizza$loadings
load.slices

par(mar = c(2,2,2,1), mfrow=c(3,1))
for(i in 1:3)barplot(load.slices[,i], ylim = c(-1, 1), main=paste('Loadings PC ',i,sep=''))
