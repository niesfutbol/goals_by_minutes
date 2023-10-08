describe("Obtain goals by number", {
  path_america <- "/workdir/tests/data/teams_statistics_2287_2022.json"
  america_statistics <- jsonlite::read_json(path_america)
  it("First example", {
    expected <- c(8, 9, 23, 24, 13, 13, 4, 0)
    obtained <- obtain_goals_by_minutes_from_team_statistics(america_statistics)
    expect_equal(obtained, expected)
  })
})
