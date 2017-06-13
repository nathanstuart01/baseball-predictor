class TeamsController < ApplicationController

  def index
    @teams = Team.search(params[:search])

  end

  def scores
    binding.pry
    @response = HTTParty.get("https://statsapi.mlb.com/api/v1/schedule?sportId=1")

  end



  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :search)
  end

end
