here::i_am("code/model.R")

data <- read.csv(
  file = here::here("data/course_engagement.csv"), header = T
) 

library(gtsummary)
library(lubridate)
library(dplyr)
library(labelled)
library(car)

# convert data
data_1 <- data %>%
  mutate(length = period_to_seconds(ms(length)))%>%
  group_by(week)%>%
  summarise(video_n = length(video_number),
            topic_n = length(unique(topic)),
            views = round(mean(views)),
            unique_viewers = round(mean(unique_viewers, na.rm = T)),
            length = round(mean(length, na.rm = T)))

var_label(data_1) <- list(video_n = "Total number of videos/week",
                          topic_n = "Total number of topics/week",
                          length = "Mean length of total video/week")

model_1 <- glm(
  views ~ length + video_n + topic_n,
  data = data_1
)

regression_table <- 
  tbl_regression(model_1, intercept = T) %>%
  add_global_p() %>%
  bold_labels() 


saveRDS(
  regression_table,
  file = here::here("output/regression_table.rds")
)

