library("dplyr")
library("tidyr")
source("agg_table.R")

#six_years <- ten_time %>% select("UsageClass", "MaterialType", "CheckoutYear", "Checkouts")

# Wrangle the data using `tidyr` and `dplyr` -- a common step!
# Select the columns for racial population totals, then
# `gather()` those column values into `race` and `population` columns
    state_race_long <- midwest %>%
       select(state, popwhite, popblack, popamerindian, popasian, popother) %>%
       gather(key = race, value = population, -state) # all columns except `state`

# Create a stacked bar chart of the number of people in each state
# Fill the bars using different colors to show racial composition
    ggplot(state_race_long) +
      geom_col(mapping = aes(x = state, y = population, fill = race))

#mats <- six_years %>% select("MaterialType", "CheckoutYear", "Checkouts") %>%
  #  group_by(MaterialType, CheckoutYear) %>%  summarize(total_count = n(), .groups = 'drop') %>%
  #  arrange(-total_count)
#View(mats)


mats <- six_years %>% select("MaterialType", "CheckoutYear", "Checkouts") %>%
    group_by(MaterialType) %>% summarize(totals = sum(Checkouts, na.rm = T)) %>%
    arrange(-totals)
top10_mats <- head(mats,10)

ggplot(top10_mats, aes(x = "", y = totals, fill = MaterialType)) +
    geom_bar(stat = "identity") +
    coord_polar(theta = "y") +
    theme_void() +
    labs(title = "top 10 material types checked out from 2017 to 2023")


