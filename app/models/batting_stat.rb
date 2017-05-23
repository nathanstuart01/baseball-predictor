class BattingStat < ApplicationRecord
  validates_presence_of :team_batting, :batting_war 
end
