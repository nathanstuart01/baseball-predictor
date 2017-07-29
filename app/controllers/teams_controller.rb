class TeamsController < ApplicationController

  def index
    @teams = Team.search(params[:search])
    respond_to do |format|
      format.html 
      format.json { render json: @teams}
      end
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
