today = as.character(Sys.Date())
start = ymd(today) - 1827

data <- sp_500 %>%
  mutate(
    stock.prices = map(symbol,
                       function(.x) get_stock_prices(.x,
                                                     return_format = "tibble",
                                                     from = start)
    ),
    log.returns  = map(stock.prices,
                       function(.x) get_log_returns(.x, return_format = "tibble")),
    mean.log.returns = map_dbl(log.returns, ~ mean(.$Log.Returns)),
    sd.log.returns   = map_dbl(log.returns, ~ sd(.$Log.Returns)),
    n.trade.days = map_dbl(stock.prices, nrow)
  )

