class BattingStat < ApplicationRecord

  belongs_to :team
  
  validates_presence_of :team_batting, :batting_war
end
