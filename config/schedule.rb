set :environment, "development"

every :day, :at => "08:31am" do
  rake "fetch_batting_stats:collect_batting_stats fetch_batting_stats:save_batting_stats_to_csv
        fetch_batting_stats:turn_batting_csv_into_batting_data fetch_batting_stats:batting_hash_into_db"
end

set :environment, "development"

every :day, :at => "08:31am" do
  rake "fetch_pitching_stats:collect_pitching_stats fetch_pitching_stats:save_pitching_stats_to_csv
        fetch_pitching_stats:turn_pitching_csv_into_pitching_data fetch_pitching_stats:pitching_hash_into_db"
end

set :environment, "development"

every :day, :at => "08:33am" do
  rake "update_team_total_war:update_team_total_war_in_db"
end

set :environment, "development"

every :day, :at => "08:31am" do
  rake "update_game_info:update_game_info_in_db"
end
