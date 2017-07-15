class BattingStatsController < ApplicationController

  def scraped_batting_wars
    @battingstats = BattingStat.all
  end
end
