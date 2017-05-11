class BattingWar < ApplicationRecord

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

   def cleararrays_and_hashes
     teambattingwar.clear
     teams.clear
     battingwar.clear
     battingwar_to_float.clear
     battingdata.clear
   end

   def re_add_teams
     (teams << unsortedteamdata.map { |team| team[0] }).flatten!
   end

   def re_add_string_batting_data
     (warstrings << unsortedteamdata.map { |war| war[19] }).flatten!
   end

   def re_add_float_batting_data
     (teambattingwars << warstrings.collect do |war|
       war.to_f
     end).flatten!
  end

  def re_add_team_data
    battingwars = [teams, teambattingwars].transpose.to_h
  end
end
