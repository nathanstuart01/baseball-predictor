class TeamsController < ApplicationController

  def index
    @teams = Team.search(params[:search])
    #@games = JSON.parse(Team.scores)
    #including this here rendered the json data I wanted
  end

  def game_info
    @games = JSON.parse(Team.scores)
    @team_info = Team.all
  end




  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :search)
  end

end
