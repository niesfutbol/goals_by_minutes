describe("Obtain goals from events", {
  event_path <- "/workdir/tests/data/data_events_881972.json"
  events <- jsonlite::read_json(event_path)
  it("Obtain minute from all 'Goal' events", {
    expected <- c(11, 21, 65)
    obtained <- get_time_from_goal_events(events)
    expect_equal(obtained, expected)
  })
  event <- list(
    "type" = "Goal",
    "time" = list("elapsed" = 21),
    "team" = list("id" = 505, "name" = "Inter"),
    "player" = list("id" = 217, "name" = "L. Martínez")
  )
  it("Obtain minutes form event type 'Goal'", {
    obtained <- get_time_if_event_is_goal(event)
    expected <- 21
    expect_equal(obtained, expected)
  })
  it("Obtain team nane from all 'Goal' events", {
    expected <- c("Cremonese", "Inter", "Inter")
    obtained <- get_name_from_goal_events(events)
    expect_equal(obtained, expected)
  })
  it("Obtain name form event type 'Goal'", {
    obtained <- get_name_if_event_is_goal(event)
    expected <- "Inter"
    expect_equal(obtained, expected)
  })
})
