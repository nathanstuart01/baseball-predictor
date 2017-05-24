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




end
