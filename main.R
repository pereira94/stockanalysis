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

plot_ly(data   = data,
        type   = "scatter",
        mode   = "markers",
        x      = ~ sd.log.returns,
        y      = ~ mean.log.returns,
        color  = ~ n.trade.days,
        colors = "Blues",
        size   = ~ n.trade.days,
        text   = ~ str_c("<em>", security, "</em><br>",
                         "Ticker: ", symbol, "<br>",
                         "Sector: ", gics.sector, "<br>",
                         "Sub Sector: ", gics.sub.industry, "<br>",
                         "No. of Trading Days: ", n.trade.days),
        marker = list(opacity = 0.8,
                      symbol = 'circle',
                      sizemode = 'diameter',
                      sizeref = 4.0,
                      line = list(width = 2, color = '#FFFFFF'))
) %>%
  layout(title   = 'S&amp;P500 Analysis: Stock Risk vs Reward',
         xaxis   = list(title = 'Risk/Variability (StDev Log Returns)',
                        gridcolor = 'rgb(255, 255, 255)',
                        zerolinewidth = 1,
                        ticklen = 5,
                        gridwidth = 2),
         yaxis   = list(title = 'Reward/Growth (Mean Log Returns)',
                        gridcolor = 'rgb(255, 255, 255)',
                        zerolinewidth = 1,
                        ticklen = 5,
                        gridwith = 2),
         margin = list(l = 100,
                       t = 100,
                       b = 100),
         font   = list(color = '#FFFFFF'),
         paper_bgcolor = 'rgb(0, 0, 0)',
         plot_bgcolor = 'rgb(0, 0, 0)')
