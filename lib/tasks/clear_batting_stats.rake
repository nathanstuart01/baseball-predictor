  #def cleararrays_and_hashes
  #  teambattingwar.clear
  #  teams.clear
  #  battingwar.clear
  #  battingwar_to_float.clear
  #  battingdata.clear
  #end
  #
  #def re_add_teams
  #  (teams << unsortedteamdata.map { |team| team[0] }).flatten!
  #end
  #
  #def re_add_string_batting_data
  #  (warstrings << unsortedteamdata.map { |war| war[19] }).flatten!
  #
  #def re_add_float_batting_data
  #  (teambattingwars << warstrings.collect do |war|
  #    war.to_f
  #  end).flatten!
  #end
  #
  #def re_add_team_data
  # battingwars = [teams, teambattingwars].transpose.to_h
  #end
