### Duke University College Rankings Over Time

#Load required packages
library(tidyverse)

#Load data
duke <- read.csv("~/Documents/R Files/duke_rankings/data/duke_rankings.csv")

#Creating static plot of all data
duke %>%
  ggplot(aes(x = YEAR, y = RANK, color = ORG)) +
  geom_line() +
  geom_point() + 
  geom_hline(yintercept = 10, linetype = "dashed", color = "grey60") + 
  scale_y_continuous(breaks = c(0, 10, 25, 50, 75, 100),
                     minor_breaks = c(12.5, 37.5, 62.5, 87.5)) +
  scale_color_manual(values = c("#9ecae1", "#4292c6", "#08306b")) + 
  labs(title = "Duke University College Rankings",
       x = "Year",
       y = "Rank",
       color = "Organization") + 
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5, size = 16),
        legend.position = c(0.1, 0.8),
        legend.title = element_text(size = 14),
        legend.text = element_text(size = 10))

