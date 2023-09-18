### Duke University College Rankings Over Time

#Load required packages
library(tidyverse)
library(gganimate)

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
  scale_color_manual(values = c("#A1B70D", "#00539B","#E89923")) + 
  labs(title = "Duke University College Rankings",
       x = "Year",
       y = "Rank",
       color = "Organization") + 
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5, size = 16),
        legend.position = c(0.1, 0.8),
        legend.title = element_text(size = 14),
        legend.text = element_text(size = 10))

#Creating static plot of ranks from 2000 onward
duke %>%
  ggplot(aes(x = YEAR, y = RANK, color = ORG)) +
  geom_line() +
  geom_point() + 
  geom_hline(yintercept = 10, linetype = "dashed", color = "grey60") + 
  scale_y_continuous(breaks = c(0, 10, 25, 50, 75, 100),
                     minor_breaks = c(12.5, 37.5, 62.5, 87.5)) +
  scale_color_manual(values = c("#A1B70D", "#00539B","#E89923")) + 
  coord_cartesian(xlim = c(2000,2022), ylim = c(0, 110)) +
  labs(title = "Duke University College Rankings",
       subtitle = "since 2000",
       x = "Year",
       y = "Rank",
       color = "Organization") + 
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5, size = 16),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        legend.position = c(0.1, 0.8),
        legend.title = element_text(size = 14),
        legend.text = element_text(size = 10))

#Creating moving plot of ranks from 2000 onward
moving_plot <- duke %>%
  filter(YEAR >= 2000) %>%
  ggplot(aes(x = YEAR, y = RANK, color = ORG)) +
  geom_line() +
  geom_point() + 
  geom_hline(yintercept = 10, linetype = "dashed", color = "grey60") + 
  scale_y_continuous(breaks = c(0, 10, 25, 50, 75, 100),
                     minor_breaks = c(12.5, 37.5, 62.5, 87.5)) +
  scale_color_manual(values = c("#A1B70D", "#00539B","#E89923")) + 
  transition_reveal(YEAR) +
  labs(title = "Duke University College Rankings",
       subtitle = "since 2000",
       x = "Year",
       y = "Rank",
       color = "Organization") + 
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5, size = 16),
        plot.subtitle = element_text(hjust = 0.5, size = 16),
        legend.position = c(0.1, 0.8),
        legend.title = element_text(size = 14),
        legend.text = element_text(size = 10))

animate(moving_plot, end_pause = 30, height = 4, width = 6, units = "in", res = 200)

anim_save("duke_rankings_since_2000.gif")

