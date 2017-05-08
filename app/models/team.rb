class Team < ApplicationRecord

  def self.search(search)

    if search
      where(["name ILIKE ?","%#{search}%"])
    else
      all
    end
  end



  def self.teambattingwars
    require 'csv'
    teambattingwar = Array.new
    CSV.foreach("teambattingwar.csv", "r:bom|utf-8") do |row|
    teambattingwar << row[0,20]
  end

  def self.team_sorter
    teams = teambattingwar.map { |el| el[0]}
  end

  def self.team_batting_war_sorter
    batting_wars = teambattingwar.map { |el| el[19] }
  end


  def team_batting_wars_to_float

    batting_wars_to_float = batting_wars.collect do |war|
      war.to_f
   end

      war.inject{ |sum, el| sum + el } /war.size
      possibly puts result here?

      now need to tie values to specific teams
    end
  end

end
