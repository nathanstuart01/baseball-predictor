class GamesController < ApplicationController

  def index
    @games = Game.where.not(home_team: nil, away_team: nil).order(game_info: :asc)
    respond_to do |format|
      format.html
      format.json { render json: @games}
      end
  end
end

## Use the below query to get games when there more to display once playoffs start
## @games = Game.where("updated_at >= ?", Time.zone.now.beginning_of_day).where.not(home_team: nil, away_team: nil).order(game_info: :asc)
