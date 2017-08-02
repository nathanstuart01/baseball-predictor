class GamesController < ApplicationController

  def index
    @games = Game.where.not(home_team: nil, away_team: nil)
    respond_to do |format|
      format.html
      format.json { render json: @games}
      end
  end
end
