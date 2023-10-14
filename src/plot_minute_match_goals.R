library(tidyverse)
library(ggplot2)
goals <- read_csv("minutes_match_goal.csv", show_col_types = FALSE)
abstract <- goals |>
  group_by(match_id) |>
  summarize(goals_total = sum(goals))
ggplot(abstract, aes(fct_lump_n(factor(goals_total), n = 7, other_level = ">6"))) +
  geom_bar(fill = rgb(0.1, 0.4, 0.5, 0.7)) +
  xlab("Número de goles") +
  ylab("Número de partidos") +
  labs(title = "Goles por partido", subtitle = "Serie A, 22-23") +
  theme_classic() +
  scale_y_continuous(
    expand = c(0, 0),
    limits = c(0, 120),
    breaks = scales::pretty_breaks()
  )
ggsave("basurita.jpg", dpi = 320)
abstract2 <- abstract |>
  mutate(goals = ifelse(goals_total > 6, ">6", goals_total)) |>
  group_by(goals) |>
  summarize(N = n())
