library(tidyverse)
library(haven)


survey_data <- read_sav('./data/ZA7500_v5-0-0.sav')


survey_data <- survey_data %>% 
  select(country,v226,v225,v243_r,v72,v80,gweight) %>% 
  mutate(v226 = floor(2022 - v226),
         v72 = ifelse(v72 <= 2,1,0),
         v80 = ifelse(v80 <= 2,1,0),
         education_lower = ifelse(v243_r == 1,1,0),
         education_medium = ifelse(v243_r == 2,1,0),
         education_higher = ifelse(v243_r == 3,1,0),
         age_sq = v226^2,
         v225 = ifelse(v225 == 1,1,0)) %>% 
  rename(
    "education" = v243_r,
    "age" = v226,
    "sex" = v225
  )


write_sav(survey_data,"./data/clean_survey_data.sav")
