library(ggplot2)
library(dplyr)
source('agg_table.R')

checkout_timeline <- six_years %>% group_by(UsageClass, CheckoutYear) %>% filter(UsageClass == 'Physical') %>% summarize(total_count = n(), .groups = 'drop')
View(checkout_timeline)

bar <- ggplot(checkout_timeline, (aes(x = CheckoutYear, y = total_count, fill = UsageClass))) +
    geom_col() +
    labs(title = "Physical Checkouts over the years", x = "checkout year", y = 'checkouts')
bar
