class PitchingWar < ApplicationRecord

  def process_raw_pitching_csv
      require 'csv'
      unsorted_pitching_data = Array.new
      CSV.foreach("teampitchingwar.csv", "r:bom|utf-8") do |row|
      unsorted_pitching_data << row[0,20]
    end
  end

  def pitching_teams
    pitching_teams = unsorted_pitching_data.map { |el| el[0]}
  end

  def team_pitching_war_sorter
    teams_pitching_string = unsorted_pitching_data.map { |el| el[17] }
  end


  def team_pitching_wars_to_float
      team_pitching_wars = teams_pitching_string.collect do |war|
      war.to_f
    end
   end

   def pitching_data_hash
     pitching_data = [pitching_teams, team_pitching_wars_to_float].transpose.to_h
   end

   def clear_arrays_and_hashes
     unsorted_pitching_data.clear
     pitching_teams.clear
     teams_pitching_string.clear
     team_pitching_wars.clear
     pitching_data.clear
   end

   def re_add_teams
     (pitching_teams << unsorted_pitching_data.map { |team| team[0] }).flatten!
   end

   def re_add_pitching_strings
     (teams_pitching_string << unsorted_pitching_data.map { |war| war[19] }).flatten!
   end

   def re_add_pitching_wars_to_float_data
     (team_pitching_wars << teams_pitching_string.collect do |war|
       war.to_f
     end).flatten!
  end

  def re_add_pitching_data_hash
    pitching_data = [pitching_teams, team_pitching_wars].transpose.to_h
  end

end
