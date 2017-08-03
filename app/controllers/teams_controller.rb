class TeamsController < ApplicationController

  def index
    @teams = Team.search(params[:search])
    respond_to do |format|
      format.html
      format.json { render json: @teams}
      end
  end



#  private figure out the explanation behind the methods below and why and when to use them

#  def set_team
#    @team = Team.find(params[:id])
#  end

#  def team_params
#    params.require(:team).permit(:name, :search)
#  end

end
