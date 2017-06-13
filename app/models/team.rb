class Team < ApplicationRecord


  has_one :pitching_stat
  has_one :batting_stat

  def self.search(search)
    if search
      where(["name ILIKE ?","%#{search}%"])
    else
      all
    end
  end

  def self.scores
  HTTParty.get("https://statsapi.mlb.com/api/v1/schedule?sportId=1")
  end




end
