class TeamsController < ApplicationController

  def index
    @teams = Team.search(params[:search])
  end

  def game_info
    @games = JSON.parse(Team.scores)
    @total_war = Team.war_calculator((Team.find_by(name: "Mariners").batting_stat.batting_war), (Team.find_by(name: "Mariners").pitching_stat.pitching_war))
  end



  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :search)
  end

end
