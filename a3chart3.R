library("dplyr")
library("tidyr")
source("agg_table.R")

#six_years <- ten_time %>% select("UsageClass", "MaterialType", "CheckoutYear", "Checkouts")


mats <- six_years %>% select("MaterialType", "CheckoutYear", "Checkouts") %>%
    group_by(MaterialType) %>% summarize(totals = sum(Checkouts, na.rm = T)) %>%
    arrange(-totals)
top10_mats <- head(mats,10)

ggplot(top10_mats, aes(x = "", y = totals, fill = MaterialType)) +
    geom_bar(stat = "identity") +
    coord_polar(theta = "y") +
    theme_void() +
    labs(title = "top 10 material types checked out from 2017 to 2023")


