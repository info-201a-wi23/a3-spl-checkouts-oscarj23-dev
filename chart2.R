
source('agg_table.R')
library(ggplot2)
usage <- six_years %>% group_by(CheckoutYear, UsageClass) %>% filter(UsageClass == 'Digital') %>%
    summarize(total_count = n(), .groups = 'drop')

line <- ggplot(usage, aes(x = CheckoutYear, y = total_count,)) +
    geom_line() +
    xlab("years") +
    ylab("Checkouts") +
    ggtitle("CHeckouts")
line
