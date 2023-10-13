get_time_from_goal_events <- function(events) {
  comprehenr::to_vec(for (event in events[["response"]]) get_time_if_event_is_goal(event))
}

get_name_from_goal_events <- function(events) {
  comprehenr::to_vec(for (event in events[["response"]]) get_name_if_event_is_goal(event))
}

get_time_if_event_is_goal <- function(event) {
  get_variable_if_event_is_goal(event, "time_elapsed")
}

get_team_id_if_event_is_goal <- function(event) {
  get_variable_if_event_is_goal(event, "team_id")
}

get_name_if_event_is_goal <- function(event) {
  get_variable_if_event_is_goal(event, "team_name")
}

get_variable_if_event_is_goal <- function(event, variable) {
  if (event[["type"]] == "Goal") {
    return_time_name(event, variable)
  }
}

return_time_name <- function(event, time_or_name) {
  RETURN_VARIABLE[[time_or_name]](event)
}

.return_team_id <- function(event) {
  return(event[["team"]][["id"]])
}

.return_team_name <- function(event) {
  return(event[["team"]][["name"]])
}

.return_time_elapsed <- function(event) {
  return(event[["time"]][["elapsed"]])
}

RETURN_VARIABLE <- list(
  "team_name" = .return_team_name,
  "team_id" = .return_team_id,
  "time_elapsed" = .return_time_elapsed
)
