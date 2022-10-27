here::i_am("code/engage_time.R") 
absolute_file_location <- here::here("data","course_engagement.csv") 
data <- read.csv(absolute_file_location, header = TRUE)

library(ggplot2)



length_sec <- c(711,287,1076,3896,347,323,229,65,155,597,169,102,126,290,566,377,527,102,482,325,534,422,315,298,63,513,207,402,209,603,441,231,587,227,177,523,391,228,414,251,271,182,371,79,1163,488,405,176,505,277,369,565,451,465,492,160,578,449,281,296,456,390,184,439,458,532,277,272,83,202,405,185,379,118,163,350,517,472,313,143)

len_sec <- c(711,287,1076,3896,347,323,229,65,155,597,169,102,126,290,566,377,527,102,482,325,534,422,315,298,63,513,207,402,209,603,441,231,587,227,177,523,391,228,414,251,271,182,371,79,1163,488,405,176,505,277,369,565,451,465,492,160,578,449,281,296,456,390,184,439,458,532,277,272,83,202,405,185,379,118,163,350,517,472,313,143)


#engagement scatterplot

avg_length_6_weeks <- c(621.77,363.53,275.91,447.44,329.81,312.24)

avg_views_6_weeks <- c(39.92,59.16,57.45,53.22,52.36,44.94)

avg_length_videos_min <- c(10.36,6.06,4.6,7.46,5.5,5.2)

weeks_avg <- c(1,2,3,4,5,6)


#length_val <- as.POSIXct(length_num, format = '%H:M:%S') #ask David

# Convert one variable to numeric



plot_1 <- plot(avg_length_videos_min,avg_views_6_weeks, xlab = "Average Weekly Length of Videos (Minutes)", ylab = "Average Weekly View Count", main = "Trends Displaying Data Science Toolkit Students Engagament Weekly", type = "h", col = "blue") +
  points(avg_length_videos_min,avg_views_6_weeks, cex = 2, pch = 19, col ="blue")

plot_1


png("output/plot_1.png")
plot(avg_length_videos_min,avg_views_6_weeks, xlab = "Average Weekly Length of Videos (Minutes)", ylab = "Average Weekly View Count", main = "Trends Displaying Data Science Toolkit Students Engagament Weekly", type = "h", col = "blue") +
  points(avg_length_videos_min,avg_views_6_weeks, cex = 2, pch = 19, col = "blue")
dev.off()




  