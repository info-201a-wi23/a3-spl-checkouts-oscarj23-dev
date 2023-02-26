library(tidyr)
library(ggplot2)
library(dplyr)

ten_time <- read.csv('/Users/oscarmaldonado/Downloads/2017-2023-10-Checkouts-SPL-Data.csv', stringsAsFactors = F)


six_years <- ten_time %>% select("UsageClass", "MaterialType", "CheckoutYear", "Checkouts")
six_years_months <- ten_time %>% select("UsageClass", "MaterialType", "CheckoutYear", "CheckoutMonth", "CheckoutType")
six_years_book <- ten_time %>% select("UsageClass", "MaterialType","CheckoutYear", "CheckoutType", "Title", "Creator")

avg_checkouts <- six_years %>% group_by(MaterialType) %>% summarize(avg = mean(Checkouts, na.rm = T))

table <- avg_checkouts %>%
    select(MaterialType,avg) %>% arrange(-avg)

my_book <- six_years_book %>% group_by(Title, Creator, CheckoutYear) %>% filter(Creator == "Rick Riordan") %>%
    summarize(total_count = n(), .groups = 'drop') %>% arrange(-total_count)

my_book_title <- my_book[[1, "Title"]]
my_book_checkouts <- my_book[[1, "total_count"]]
my_book_year <- my_book[[1, "CheckoutYear"]]


checkout_digital_20 <- six_years %>% group_by(CheckoutYear, UsageClass) %>%
    filter(CheckoutYear == 2020) %>% filter(UsageClass == 'Digital') %>%
    summarize(total_count = n(), .groups = 'drop')
count_digital20 <- checkout_digital_20[[1, "total_count"]]

checkout_physical_20 <- six_years %>% group_by(CheckoutYear, UsageClass) %>%
    filter(CheckoutYear == 2020) %>% filter(UsageClass == 'Physical') %>%
    summarize(total_count = n(), .groups = 'drop')
count_physical20 <- checkout_physical_20[[1, "total_count"]]

checkout_digital_19 <- six_years %>% group_by(CheckoutYear, UsageClass) %>%
    filter(CheckoutYear == 2019) %>% filter(UsageClass == 'Digital') %>%
    summarize(total_count = n(), .groups = 'drop')
count_digital19 <- checkout_digital_19[[1, "total_count"]]

checkout_physical_19 <- six_years %>% group_by(CheckoutYear, UsageClass) %>%
    filter(CheckoutYear == 2019) %>% filter(UsageClass == 'Physical') %>%
    summarize(total_count = n(), .groups = 'drop')
count_physical19 <- checkout_physical_19[[1, "total_count"]]


current_checkouts <- six_years_months %>% group_by(MaterialType, CheckoutYear) %>% filter(MaterialType == "EBOOK") %>%
    summarize(total_count = n(), .groups = 'drop')
ebook_checkouts22 <- current_checkouts[[6, "total_count"]]

current_checkouts <- six_years_months %>% group_by(MaterialType, CheckoutYear) %>% filter(MaterialType == "AUDIOBOOK") %>%
    summarize(total_count = n(), .groups = 'drop')
audio_checkouts22 <- current_checkouts[[6, "total_count"]]

current_checkouts <- six_years_months %>% group_by(MaterialType, CheckoutYear) %>% filter(MaterialType == "BOOK") %>%
    summarize(total_count = n(), .groups = 'drop')
book_checkouts22 <- current_checkouts[[6, "total_count"]]


current_checkouts <- six_years_months %>% group_by(MaterialType, CheckoutYear) %>% filter(MaterialType == "EBOOK") %>%
    summarize(total_count = n(), .groups = 'drop')
ebook_checkouts17 <- current_checkouts[[1, "total_count"]]

current_checkouts <- six_years_months %>% group_by(MaterialType, CheckoutYear) %>% filter(MaterialType == "AUDIOBOOK") %>%
    summarize(total_count = n(), .groups = 'drop')
audio_checkouts17 <- current_checkouts[[1, "total_count"]]


current_checkouts <- six_years_months %>% group_by(MaterialType, CheckoutYear) %>% filter(MaterialType == "BOOK") %>%
    summarize(total_count = n(), .groups = 'drop')
book_checkouts17 <- current_checkouts[[1, "total_count"]]

print(book_checkouts22) #book checkouts '22
print(audio_checkouts22) #audio book checkouts '22
print(ebook_checkouts22) #ebook checkouts '22
print(count_digital20) #digital Checkouts '20
print(count_physical20) #physical Checkouts '20
print(count_digital19) #digital Checkouts '19
print(count_physical19) #physical Checkouts '19
print(book_checkouts17) #book checkouts '17
print(ebook_checkouts17) #ebook checkouts '17
print(audio_checkouts17) #audio checkouts '17

