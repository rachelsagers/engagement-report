here::i_am("code/visual.R") 
absolute_file_location <- here::here("data","course_engagement.csv") 
data <- read.csv(absolute_file_location, header = TRUE)

library(ggplot2)

convert_hh_mm_ss_to_numeric <- function(x){
  split_x <- strsplit(x, split = ":")
  get_minutes <- function(y){
    y <- as.numeric(y)
    if(length(y) == 1){
      # assume it's seconds
      y / 60
    }else if(length(y) == 2){
      y[1] + y[2]/60
    }else if(length(y) == 3){
      60 * y[1] + y[2] + y[3]/60
    }else{
      NA
    }
  }
  minutes <- unlist(lapply(split_x, get_minutes))
  return(minutes)
}

data$new_length <- convert_hh_mm_ss_to_numeric(data$length)

library(dplyr)

data %>% # creating a new variable that sums the total video length for each topic
      group_by(topic) %>%
      mutate(sum_lengths = sum(new_length)) -> data

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

