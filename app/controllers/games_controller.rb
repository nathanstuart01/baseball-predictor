class GamesController < ApplicationController

  def index
    @games = Game.where.not(home_team: nil, away_team: nil )
  end
end
