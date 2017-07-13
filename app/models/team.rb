class Team < ApplicationRecord
  include HTTParty


  has_one :pitching_stat
  has_one :batting_stat

  def self.search(search)
    if search
      where(["name ILIKE ?","%#{search}%"])
    else
      all.order(:name)
    end
  end

  def self.scores
  HTTParty.get("https://statsapi.mlb.com/api/v1/schedule?sportId=1",
              headers: {
                "Content-type" => 'application/json'
                }).body

  end




end
