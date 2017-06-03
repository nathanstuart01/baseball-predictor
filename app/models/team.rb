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
   HTTParty.get("https://statsapi.mlb.com/api/v1/schedule?sportId=1&date=2017-06-03&hydrate=team,linescore(matchup,runners),flags,liveLookin,broadcasts(all),decisions,person,probablePitcher,stats,homeRuns,previousPlay,game(content(media(featured,epg),summary),tickets",
              headers: {
                "Content-type" => 'application/json'
              }).body
   end




end
