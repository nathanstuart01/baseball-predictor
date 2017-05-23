class PitchingStat < ApplicationRecord
  validates_presence_of :team_pitching, :pitching_war 
end
