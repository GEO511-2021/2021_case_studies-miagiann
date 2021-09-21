data(iris)
# load in iris dataset
data(iris)
# mean of Petal.Length 
Petal.Length <- iris$Petal.Length

petal_length_mean <- mean(Petal.Length)
# Plotting histogram w hist function
hist(Petal.Length,
     main = "Histogram of Petal Length",
     xlab = "Petal Length", 
     xlim = c(0,8),
     las =1,
     breaks = 16,
     col = "pink",
     ylim = c(0,40))

# Plotting histogram w ggplot
library(ggplot2)
Petal.Length <- iris$Petal.Length
mean_Petal_Length <- mean(Petal.Length)
ggplot(data  = iris, aes(x = Petal.Length))+
  geom_histogram(breaks = seq (0,8, by = .5),
                 col = 'blue',
                 aes(fill= ..count..))+
  scale_fill_gradient("Count", low = 'blue', high='pink')

