library(tidyverse)
library(plotly)
agree_scoring <- read_delim(
    "./agree_scoring.csv",
    delim = ";"
    )

agree_long <- agree_scoring |>
    pivot_longer(
        cols = 2:7,
        names_to = "domain",
        values_to = "score"
        )

agree_boxplot <- plot_ly(
    agree_long,
    y = ~score,
    color = ~domain,
    type = "box",
    boxpoints = "all",
    text = agree_long$guideline
) |>
layout(
    showlegend = FALSE, 
    xaxis = list(fixedrange = TRUE), 
    yaxis = list(fixedrange = TRUE)
)
