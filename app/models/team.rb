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

  def self.win_predictor(total_war1, total_war2)
      raw_win_difference = total_war1 - total_war2
      if raw_win_difference < 0
        @total_war_difference = raw_win_difference * -1
      else
        @total_war_difference = raw_win_difference * 1
      end
  end
end
