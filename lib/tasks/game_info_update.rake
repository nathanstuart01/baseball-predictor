namespace :update_game_info do

  desc "Get and Update Game Team, Time, Date Info and Saveto DB"
  task update_game_info_in_db: :environment do

    require 'httparty'
    require 'json'

    @raw_games_data = HTTParty.get("https://statsapi.mlb.com/api/v1/schedule?sportId=1")

    @games_data = JSON.parse(@raw_games_data.body)

    i = 0
    x = @games_data["dates"][0]["games"].length
    z = 1

      while (i < x) do

        Game.update(z,
        home_team: @games_data["dates"][0]["games"][i]["teams"]["home"]["team"]["name"],
        away_team: @games_data["dates"][0]["games"][i]["teams"]["away"]["team"]["name"],
        game_info: @games_data["dates"][0]["games"][i]["gameDate"])

      i += 1
      z += 1

    end
  end
end
