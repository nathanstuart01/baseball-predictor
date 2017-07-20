namespace :update_game_info do

  desc "Update Game Team, Time, Date Info to DB"
  task update_game_info_in_db: :environment do
    Game.update(1, home_team: "Mariners", away_team: "Yankees")

  end
end
