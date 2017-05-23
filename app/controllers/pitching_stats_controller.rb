class PitchingStatsController < ApplicationController

  def scraped_pitching_wars
    @pitchingstats = PitchingStat.all
  end
end
