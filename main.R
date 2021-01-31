library(stockanalysis)

boto3 <- import("boto3")

s3_client(boto3 = boto3)


today = as.character(Sys.Date())
start = ymd(today) - 1827
getSymbols("CARR", from = "2020-01-01")
CARR %>% head()

"CARR" %>%
  get_stock_prices(return_format = "tibble") %>%
  get_log_returns(return_format = "tibble")
