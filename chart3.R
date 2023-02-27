library("dplyr")
library("tidyr")
library("plotly")
source("agg_table.R")

mats <- six_years %>% select("MaterialType", "CheckoutYear", "Checkouts") %>%
    group_by(MaterialType) %>% summarize(totals = sum(Checkouts, na.rm = T)) %>%
    arrange(-totals)
top10_mats <- head(mats,10)

plot_ly(top10_mats, labels = ~MaterialType, values = ~totals, type = "pie") %>%
  layout(title = "Top 10 Materials from 2017-2023",
         showlegend = TRUE)


