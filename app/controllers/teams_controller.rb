class TeamsController < ApplicationController

  def index
    @teams = Team.search(params[:search])
    #   render json: Team.scores
    #including this here rendered the json data I wanted
  end

  def scores

    render json: Team.scores
  end




  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :search)
  end

end
