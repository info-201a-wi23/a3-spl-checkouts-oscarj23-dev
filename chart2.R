
source('agg_table.R')
library(ggplot2)
usage <- six_years %>% group_by(CheckoutYear, UsageClass) %>% filter(UsageClass == 'Digital') %>%
    summarize(totals = sum(Checkouts, na.rm = T))
View(usage)

line <- ggplot(usage, aes(x = CheckoutYear, y = totals,)) +
    geom_line() +
    xlab("years") +
    ylab("Checkouts") +
    ggtitle("Checkouts")
line
