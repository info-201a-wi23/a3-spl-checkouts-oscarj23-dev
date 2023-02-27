library(ggplot2)
library(dplyr)
source('agg_table.R')

checkout_timeline <- six_years %>% group_by(UsageClass, CheckoutYear) %>% filter(UsageClass == 'Physical') %>%
    summarize(totals = sum(Checkouts))
View(checkout_timeline)

bar <- ggplot(checkout_timeline, (aes(x = CheckoutYear, y = totals, fill = UsageClass))) +
    geom_col() +
    labs(title = "Physical Checkouts over the years", x = "checkout year", y = 'checkouts')
bar
