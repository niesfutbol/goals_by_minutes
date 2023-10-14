obtain_local_info_from_fixture <- function(fixture) {
  list(
    "fixture_id" = fixture[["fixture"]][["id"]],
    "date" = fixture[["fixture"]][["date"]],
    "league_id" = fixture[["league"]][["id"]],
    "season" = fixture[["league"]][["season"]],
    "round" = fixture[["league"]][["round"]],
    "team_id" = fixture[["teams"]][["home"]][["id"]],
    "home" = TRUE,
    "score_halftime" = fixture[["score"]][["halftime"]][["home"]],
    "score_fulltime" = fixture[["score"]][["fulltime"]][["home"]]
  )
}

obtain_away_info_from_fixture <- function(fixture) {
  list(
    "fixture_id" = fixture[["fixture"]][["id"]],
    "date" = fixture[["fixture"]][["date"]],
    "league_id" = fixture[["league"]][["id"]],
    "season" = fixture[["league"]][["season"]],
    "round" = fixture[["league"]][["round"]],
    "team_id" = fixture[["teams"]][["away"]][["id"]],
    "home" = FALSE,
    "score_halftime" = fixture[["score"]][["halftime"]][["away"]],
    "score_fulltime" = fixture[["score"]][["fulltime"]][["away"]]
  )
}
