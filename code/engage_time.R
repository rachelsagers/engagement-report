here::i_am("code/engage_time.R") 
absolute_file_location <- here::here("data","course_engagement.csv") 
data <- read.csv(absolute_file_location, header = TRUE)

library(ggplot2)

#engagement scatterplot

avg_length_6_weeks <- c(621.77,363.53,275.91,447.44,329.81,312.24)

avg_views_6_weeks <- c(39.92,59.16,57.45,53.22,52.36,44.94)

avg_length_videos_min <- c(10.36,6.06,4.6,7.46,5.5,5.2)

unique_views_avg <- c(25.62,35.26,35.55,32.56,32.82,27.59)

weeks_avg <- c(1,2,3,4,5,6)



# Convert one variable to numeric

labelset <- c('Week 1', 'Week 2', 'Week 3', 'Week 4', 'Week 5', 'Week 6')

time_plot <- plot(avg_length_videos_min,unique_views_avg, xlab = "Average Weekly Length of Videos (Minutes)", lwd = 80, ylab = "Average Weekly View Count", main = "Trends Displaying Data Science Toolkit Students Weekly Engagement", type = "h", col = c("purple","red","green","pink","blue","orange")) +
  points(avg_length_videos_min,unique_views_avg, cex = 2, pch = 19, col = c("purple","red","green","pink","blue","orange"))



png("output/time_plot.png")

plot(avg_length_videos_min,unique_views_avg, xlab = "Average Weekly Length of Videos (Minutes)", lwd = 80, ylab = "Average Weekly View Count", main = "Trends Displaying Data Science Toolkit Students Weekly Engagement", type = "h", col = c("purple","red","green","pink","blue","orange")) +
  points(avg_length_videos_min,unique_views_avg, cex = 2, pch = 19, col = c("purple","red","green","pink","blue","orange"))
dev.off()


