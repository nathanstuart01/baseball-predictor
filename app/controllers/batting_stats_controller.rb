class BattingStatsController < ApplicationController

  def scraped_batting_wars
    @battingstats = BattingStat.all
  end

    private


  def batting_stat_params
    params.require(:batting_stat).permit(:team_batting, :batting_war, :team_id)
  end

  def set_team
    @team = Team.find(params[:id])
  end

  def set_batting_stat
    @batting_stat = @team.battingstat.find(params[:id])
  end


end
