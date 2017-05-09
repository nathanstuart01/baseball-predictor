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
  end

  def self.team_sorter
    teams = teambattingwar.map { |el| el[0]}
  end

  def self.team_batting_war_sorter
    battingwar = teambattingwar.map { |el| el[19] }
  end


  def team_batting_wars_to_float
      battingwar_to_float = battingwar.collect do |war|
      war.to_f
    end
   end

   def battingdata
     battingdata = [teams, battingwar_to_float].transpose.to_h
   end


end
