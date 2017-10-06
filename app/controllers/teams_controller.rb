class TeamsController < ApplicationController

  def index
    @teams = Team.search(params[:search])
    respond_to do |format|
      format.html
      format.json { render json: @teams}
      end
  end

end
