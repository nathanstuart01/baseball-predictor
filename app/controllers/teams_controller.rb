class TeamsController < ApplicationController

  def index
    @teams = Team.search(params[:search])
    @team_data = Team.all
    render json: @team_data
  end

  def game_info
    @total_war_difference = Team.win_predictor(Team.second.total_war, Team.third.total_war)
  end



  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :search)
  end

end
