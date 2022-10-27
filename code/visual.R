here::i_am("code/visual.R") 
absolute_file_location <- here::here("data","course_engagement.csv") 
data <- read.csv(absolute_file_location, header = TRUE)

library(ggplot2)

# Replacing the ":" with a "." so that R can recognize it eventually as numeric variable
data$length_sub <- gsub(":", ".", data$length) # trying to replace all the colons with a period and creating a new variable
data$length_sub
table(data$length_sub)

# Adding quotation marks 
data$length_new <- gsub(",", "", data$length_sub)                        
data$length_new                                                
str(data$length_new)

# Changing one value so that it can be summed later
data$length_new[data$length_new == "1.04.56"] <- "62.5"

# Turning the length variable into a numeric variable
data$leng <- as.numeric(data$length_new)
summary(data$leng)

library(dplyr)

data %>% # creating a new variable that sums the total video length for each topic
      group_by(topic) %>%
      mutate(sum_lengths = sum(leng)) -> data

summary(data$sum_lengths) # checking to see how many NAs there are

# visualize a comparison of the total length of all videos for each topic 
bar_plot <- ggplot(data, aes(x = topic, y = sum_lengths, fill = topic)) + 
  geom_bar(position="dodge", stat="identity") +
  labs(x = "Topic" , y = "Length of Video (in minutes)", title = "Figure 1. INFO 550 Lecture Video Lengths by Topic") + 
  scale_x_discrete(labels = c("Course Logistics", "Mac Install",
                                  "Make", "Project Organization",
                                  "RMarkdown", "Terminal",
                                  "Windows Install")) +
  scale_fill_manual(name = "Topics", labels = c('Course Logistics', 
                                                "Mac Install",
                                                "Make",
                                                "Project Organization",
                                                "RMarkdown",
                                                "Terminal",
                                                "Windows Install"),
                    values = c('aquamarine', 'aquamarine3', 
                               'lightseagreen', 'pink',
                               'lightblue1', 'lightblue',
                               'lightskyblue4')) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme_bw()

bar_plot

ggsave(here::here("output/bar_plot.png"), 
       plot = bar_plot,
       width = 10,
       height = 8,
       units = "in",
       device = "png")
