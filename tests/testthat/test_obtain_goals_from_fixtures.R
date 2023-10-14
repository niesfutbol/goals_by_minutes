describe("Obtain goal by half from fixture", {
  it("take local info", {
    fixture <- list(
      "fixture" = list("id" = 881781, "date" = "2022-08-13T16:30:00+00:00"),
      "league" = list("id" = 135, "season" = 2022, "round" = "Regular Season - 1"),
      "teams" = list(
        "home" = list("id" = 498, "winner" = FALSE),
        "away" = list("id" = 499, "winner" = TRUE)
      ),
      "goals" = list("home" = 0, "away" = 2),
      "score" = list(
        "halftime" = list("home" = 0, "away" = 1),
        "fulltime" = list("home" = 0, "away" = 2)
      )
    )
    expected <- list(
      "fixture_id" = 881781,
      "date" = "2022-08-13T16:30:00+00:00",
      "league_id" = 135,
      "season" = 2022,
      "round" = "Regular Season - 1",
      "team_id" = 498,
      "home" = TRUE,
      "score_halftime" = 0,
      "score_fulltime" = 0
    )
    obtained <- obtain_local_info_from_fixture(fixture)
    expect_equal(expected, obtained)
  })
  it("take away info", {
    fixture <- list(
      "fixture" = list("id" = 881781, "date" = "2022-08-13T16:30:00+00:00"),
      "league" = list("id" = 135, "season" = 2022, "round" = "Regular Season - 1"),
      "teams" = list(
        "home" = list("id" = 498, "winner" = FALSE),
        "away" = list("id" = 499, "winner" = TRUE)
      ),
      "goals" = list("home" = 0, "away" = 2),
      "score" = list(
        "halftime" = list("home" = 0, "away" = 1),
        "fulltime" = list("home" = 0, "away" = 2)
      )
    )
    expected <- list(
      "fixture_id" = 881781,
      "date" = "2022-08-13T16:30:00+00:00",
      "league_id" = 135,
      "season" = 2022,
      "round" = "Regular Season - 1",
      "team_id" = 499,
      "home" = FALSE,
      "score_halftime" = 1,
      "score_fulltime" = 2
    )
    obtained <- obtain_away_info_from_fixture(fixture)
    expect_equal(expected, obtained)
  })
})
