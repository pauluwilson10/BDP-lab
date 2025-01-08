data1 <- c(10, 15, 20, 25, 30, 35, 40, 45, 50)
mean_1<-mean(data1)
median_1<-median(data1)
first_quartile_1<-quantile(data1,0.25)
third_quartile_1<-quantile(data1,0.75)
min_val_1<-min(data1)
max_val<-max(data1)

cat('summary of statistics of data1 \n')
cat('mean of dataset1 :',mean_1, '\n')
cat('median of dataset1 :',median_1, '\n')
cat('first quartile of dataset1 :',first_quartile_1, '\n')
cat('Third quartile of dataset1 :',third_quartile_1, '\n')
cat('minimum value of dataset1 : ',min_val_1, '\n')
cat('maximum value of dataset1 :',max_val, '\n')
cat('varaiance  of dataset1 :',var(data1), '\n')

boxplot(data1,main='boxplot of data1',ylab='values',col='lightblue')
data2 <- c(5,10, 15, 20, 25, 30, 35, 40, 45)
covar<-cov(data1,data2)
corel<-cor(data1,data2)
cat('covariance of data 1 and data 2 are :',covar,'\n')
cat('corelation of data 1 and data 2 are :',corel,'\n')




