library(rmarkdown)
library(dplyr)
library(haven)

survey_data <- read_sav('./data/clean_survey_data.sav')
survey_data$country <- haven::as_factor(survey_data$country)

unique_countries <-unique(survey_data$country)

for(country in unique_countries) {

  output_file <- paste0("./outputs/report_", gsub(" ", "_", tolower(country)), ".html")
  
  rmarkdown::render(input = "./country_level_html_report.Rmd",
                    output_file = output_file,
                    params = list(country = country))
}
