obtain_home_info_from_fixture <- function(fixture) {
  c(
    .obtain_match_info_from_fixture(fixture),
    .obtain_home_team_info_from_fixture(fixture)
  )
}

obtain_away_info_from_fixture <- function(fixture) {
  match_info <- .obtain_match_info_from_fixture(fixture)
  away_info <- .obtain_away_team_info_from_fixture(fixture)
  c(match_info, away_info)
}

.obtain_match_info_from_fixture <- function(fixture) {
  list(
    "fixture_id" = fixture[["fixture"]][["id"]],
    "date" = fixture[["fixture"]][["date"]],
    "league_id" = fixture[["league"]][["id"]],
    "season" = fixture[["league"]][["season"]],
    "round" = fixture[["league"]][["round"]]
  )
}

.obtain_away_team_info_from_fixture <- function(fixture) {
  .obtain_team_info_from_fixture(fixture, "away")
}

.obtain_home_team_info_from_fixture <- function(fixture) {
  .obtain_team_info_from_fixture(fixture, "home")
}

.obtain_team_info_from_fixture <- function(fixture, local) {
  away_info <- list(
    "team_id" = fixture[["teams"]][[local]][["id"]],
    "home" = ifelse(local == "home", TRUE, FALSE),
    "score_halftime" = fixture[["score"]][["halftime"]][[local]],
    "score_fulltime" = fixture[["score"]][["fulltime"]][[local]]
  )
}
