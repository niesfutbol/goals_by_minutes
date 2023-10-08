obtain_goals_by_minutes_from_paths <- function(paths) {
  goals <- 0
  for (path in paths) {
    team_stat <- jsonlite::read_json(path)
    team_goals <- obtain_goals_by_minutes_from_team_statistics(team_stat)
    goals <- goals + team_goals
  }
  return(goals)
}

obtain_goals_by_minutes_from_team_statistics <- function(team_stat) {
  goals_by_minutes <- team_stat[["response"]][["goals"]][["for"]][["minute"]]
  comprehenr::to_vec(for (goals in goals_by_minutes) .fix_element(goals[["total"]]))
}

.fix_element <- function(element) {
  if (is.null(element)) {
    element <- 0
  }
  return(element)
}
