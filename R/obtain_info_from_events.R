get_time_if_event_is_goal <- function(event) {
  if (event[["type"]] == "Goal") {
    return(event[["time"]][["elapsed"]])
  }
}
