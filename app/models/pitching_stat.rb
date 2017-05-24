class PitchingStat < ApplicationRecord

  belongs_to :team
  
  validates_presence_of :team_pitching, :pitching_war
end
