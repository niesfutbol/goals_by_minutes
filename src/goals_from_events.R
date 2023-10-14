library("tidyverse")
library("goals")
parent_file <- "/workdir/data/events/"
files <- list.files(parent_file)
goals <- tibble::tibble()
for (file in files) {
  path <- glue::glue("{parent_file}{file}")
  events <- jsonlite::read_json(path)
  goalsFromEvents <- GoalsFromEvents$new(events)
  goal_minute <- goalsFromEvents$goal_minutes
  goal <- 1
  if (is.null(goalsFromEvents$goal_minutes)) {
    goal_minute <- 0
  }
  if (is.null(goalsFromEvents$goal_minutes)) {
    goal <- 0
  }
  match <- tibble::tibble(
    minute = goal_minute,
    match_id = goalsFromEvents$match_id,
    goals = goal
  )
  goals <- rbind(goals, match)
}
goals |> write_csv("minutes_match_goal.csv")
