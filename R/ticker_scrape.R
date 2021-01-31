# Scraping SP500 tickers
sp_500 <- read_html("https://en.wikipedia.org/wiki/List_of_S%26P_500_companies") %>%
  html_node("table.wikitable") %>%
  html_table() %>%
  select(`Symbol`, Security, `GICS Sector`, `GICS Sub-Industry`) %>%
  as_tibble()
# Formatting names
names(sp_500) <- sp_500 %>%
  names() %>%
  str_to_lower() %>%
  make.names()

sp_500$symbol <- gsub("\\.", "-", sp_500$symbol)

write.csv(sp_500, "/Users/pedropereira/Documents/stockanalysis/tickers.csv")

