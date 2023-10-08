describe("Obtain goals by number", {
  path_america <- "/workdir/tests/data/teams_statistics_2287_2022.json"
  america_statistics <- jsonlite::read_json(path_america)
  it("América example", {
    expected <- c(8, 9, 23, 24, 13, 13, 4, 0)
    obtained <- obtain_goals_by_minutes_from_team_statistics(america_statistics)
    expect_equal(obtained, expected)
  })
  path_atletico <- "/workdir/tests/data/teams_statistics_530_2022.json"
  atletico_statistics <- jsonlite::read_json(path_atletico)
  it("Atlético Madrid example", {
    expected <- c(6, 16, 5, 16, 12, 10, 3, 0)
    obtained <- obtain_goals_by_minutes_from_team_statistics(atletico_statistics)
    expect_equal(obtained, expected)
  })
})
