library(tidyverse)
library(janitor)

season_2015 <- read_csv("2014-2015.csv") %>% mutate(season = "2014-2015")
season_2016 <- read_csv("2015-2016.csv") %>% mutate(season = "2015-2016")
season_2017 <- read_csv("2016-2017.csv") %>% mutate(season = "2016-2017")
season_2018 <- read_csv("2017-2018.csv") %>% mutate(season = "2017-2018")
season_2019 <- read_csv("2018-2019.csv") %>% mutate(season = "2018-2019")
season_2020 <- read_csv("2019-2020.csv") %>% mutate(season = "2019-2020")

combined_data <- bind_rows(
  season_2015, season_2016, season_2017, season_2018, season_2019, season_2020
)

combined_data <- combined_data %>% clean_names()

relevant_data <- combined_data %>%
  select(player_name, season, x_g, goals) %>%
  rename(
    expected_goals = x_g,
    actual_goals = goals
  )

player_seasons_xg <- relevant_data %>%
  group_by(player_name) %>%
  arrange(player_name, season) %>%
  mutate(
    next_season_goals = lead(actual_goals)  # Goals in the next season
  ) %>%
  filter(!is.na(next_season_goals)) %>%
  ungroup()

player_seasons_prev_goals <- player_seasons_xg %>%
  mutate(
    previous_season_goals = lag(actual_goals)  # Goals from the previous season
  ) %>%
  filter(!is.na(previous_season_goals))

# Expected Goals vs Next Season Goals plot
ggplot(player_seasons_xg, aes(x = expected_goals, y = next_season_goals)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE, color = "green") +
  labs(
    title = "Expected Goals vs Next Season Goals",
    x = "Expected Goals (Current Season)",
    y = "Next Season Goals"
  )

# Previous Season Goals vs Next Season Goals plot
ggplot(player_seasons_prev_goals, aes(x = previous_season_goals, y = next_season_goals)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(
    title = "Previous Season Goals vs Next Season Goals",
    x = "Previous Season Goals",
    y = "Next Season Goals"
  )

model_xg <- lm(next_season_goals ~ expected_goals, data = player_seasons_xg)
rmse_xg <- sqrt(mean((predict(model_xg, player_seasons_xg) - player_seasons_xg$next_season_goals)^2))
print(paste("RMSE (Expected Goals):", round(rmse_xg, 2)))

model_prev_goals <- lm(next_season_goals ~ previous_season_goals, data = player_seasons_prev_goals)
rmse_prev_goals <- sqrt(mean((predict(model_prev_goals, player_seasons_prev_goals) - player_seasons_prev_goals$next_season_goals)^2))
print(paste("RMSE (Previous Season Goals):", round(rmse_prev_goals, 2)))


