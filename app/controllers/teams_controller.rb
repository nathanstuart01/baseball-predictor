class TeamsController < ApplicationController

  def index
    @teams = Team.search(params[:search])

  end



  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :search)
  end

end
