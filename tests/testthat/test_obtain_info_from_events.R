describe("Obtain goals from events", {
  path_america <- "/workdir/tests/data/data_events_881972.json"
  america_statistics <- jsonlite::read_json(path_america)
  it("Obtain event type", {
    event <- list(
      "type" = "Goal",
      "time" = list("elapsed" = 21),
      "team" = list("id" = 505, "name" = "Inter"),
      "player" = list("id" = 217, "name" = "L. Martínez")
    )
    obtained <- get_time_if_event_is_goal(event)
    expected <- 21
    expect_equal(obtained, expected)
  })
})
