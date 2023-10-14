library(tidyverse)
league_season <- "39_2022"
team_id <- read_csv(glue::glue("tests/data/names_{league_season}.csv"), show_col_types = FALSE)
paths <- comprehenr::to_vec(for (id in team_id$id) glue::glue("tests/data/teams_statistics_{league_season}_{id}.json"))
goals <- obtain_goals_by_minutes_from_paths(paths)
