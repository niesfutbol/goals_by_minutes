get_time_from_goal_events <- function(events) {
  comprehenr::to_vec(for (event in events[["response"]]) get_time_if_event_is_goal(event))
}

get_name_from_goal_events <- function(events) {
  comprehenr::to_vec(for (event in events[["response"]]) get_name_if_event_is_goal(event))
}

get_time_if_event_is_goal <- function(event) {
  if (event[["type"]] == "Goal") {
    .return_time_elapsed(event)
  }
}

get_name_if_event_is_goal <- function(event) {
  if (event[["type"]] == "Goal") {
    .return_team_name(event)
  }
}

.return_team_name <- function(event) {
  return(event[["team"]][["name"]])
}

.return_time_elapsed <- function(event) {
  return(event[["time"]][["elapsed"]])
}
