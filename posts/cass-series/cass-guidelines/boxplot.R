library(tidyverse)
library(ggbeeswarm)
library(ggrepel)
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

agree_label <- agree_long |>
    filter(
        guideline %in% c(
            "Council for Choices in Healthcare Finland 2020", 
            "Swedish National Board of Health & Welfare 2022"
            )
    ) |>
    mutate(label = ifelse(
        guideline == "Council for Choices in Healthcare Finland 2020", 
        "Finlande", 
        "Suède"
        )
    )

agree_boxplot <- agree_long |>
    ggplot(aes(x = domain, y = score)) + 
    stat_boxplot() +
    geom_beeswarm(aes(color = guideline), size = 3, cex = 2) + 
    geom_text_repel(aes(label = label), data = agree_label) + 
    theme_minimal() + 
    theme(legend.position = "bottom")
