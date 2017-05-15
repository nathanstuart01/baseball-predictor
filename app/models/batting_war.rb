class BattingWar < ApplicationRecord

  require 'nokogiri'
  require 'open-uri'

  open("http://www.espn.com/mlb/stats/team/_/stat/batting")
  batting_document = _
  batting_content = batting_document.Read
  parsed_batting_content = Nokogiri::HTML(batting_content)
  parsed_batting_content.css('.evenrow.team-10-8').css('td').text

  parsed_batting_content.css('.evenrow.team-10-8').css('td').each do |td|
    different_team_array << td.text
  end

# will need to then get an array of all the team data for batting and pitching data, and call the following loop on each one

def create_team_arrays_of_batting_data
yankees, orioles, red_sox, blue_jays, rayswhite_sox, tigers, royals, twins, indians,
mariners, astros, rangers, angels, athletics, phillies, mets, braves, marlins,
nationals, cardinals, cubs, pirates, reds, brewers, dodgers, giants, rockies,
diamondbacks, padres = Array.new(30, [])
end

  def add_batting_data_to_each_team_array
    parsed_batting_content.css('.oddrow.team-10-20').css('td').each do |td|
      nationals << td.text
    end

    parsed_batting_content.css('.evenrow.team-10-8').css('td').each do |td|
      brewers << td.text
    end

    parsed_batting_content.css('.oddrow.team-10-10').css('td').each do |td|
      yankees << td.text
    end

    parsed_batting_content.css('.evenrow.team-10-19').css('td').each do |td|
      dodgers << td.text
    end

    parsed_batting_content.css('.oddrow.team-10-18').css('td').each do |td|
      astros << td.text
    end

    parsed_batting_content.css('.evenrow.team-10-29').css('td').each do |td|
      diamondbacks << td.text
    end

    parsed_batting_content.css('.oddrow.team-10-27').css('td').each do |td|
      rockies << td.text
    end

    parsed_batting_content.css('.evenrow.team-10-21').css('td').each do |td|
      mets << td.text
    end

    parsed_batting_content.css('.oddrow.team-10-12').css('td').each do |td|
      mariners << td.text
    end

    parsed_batting_content.css('.evenrow.team-10-17').css('td').each do |td|
      reds << td.text
    end

    parsed_batting_content.css('.oddrow.team-10-13').css('td').each do |td|
      rangers << td.text
    end

    parsed_batting_content.css('.evenrow.team-10-30').css('td').each do |td|
      rays << td.text
    end

    parsed_batting_content.css('.oddrow.team-10-16').css('td').each do |td|
      cubs << td.text
    end

    parsed_batting_content.css('.evenrow.team-10-6').css('td').each do |td|
      tigers << td.text
    end

    parsed_batting_content.css('.oddrow.team-10-2').css('td').each do |td|
      red_sox << td.text
    end

    parsed_batting_content.css('.evenrow.team-10-24').css('td').each do |td|
      cardinals << td.text
    end

    parsed_batting_content.css('.oddrow.team-10-1').css('td').each do |td|
      orioles << td.text
    end

    parsed_batting_content.css('.evenrow.team-10-22').css('td').each do |td|
      phillies << td.text
    end

    parsed_batting_content.css('.oddrow.team-10-28').css('td').each do |td|
      marlins << td.text
    end

    parsed_batting_content.css('.evenrow.team-10-9').css('td').each do |td|
      twins << td.text
    end

    parsed_batting_content.css('.oddrow.team-10-5').css('td').each do |td|
      indians << td.text
    end

    parsed_batting_content.css('.evenrow.team-10-3').css('td').each do |td|
      angels << td.text
    end

    parsed_batting_content.css('.oddrow.team-10-14').css('td').each do |td|
      blue_jays << td.text
    end

    parsed_batting_content.css('.evenrow.team-10-15').css('td').each do |td|
      braves << td.text
    end

    parsed_batting_content.css('.oddrow.team-10-4').css('td').each do |td|
      white_sox << td.text
    end

    parsed_batting_content.css('.evenrow.team-10-11').css('td').each do |td|
      athletics << td.text
    end

    parsed_batting_content.css('.oddrow.team-10-25').css('td').each do |td|
      padres << td.text
    end

    parsed_batting_content.css('.evenrow.team-10-23').css('td').each do |td|
      pirates << td.text
    end

    parsed_batting_content.css('.oddrow.team-10-26').css('td').each do |td|
      giants << td.text
    end

    parsed_batting_content.css('.evenrow.team-10-7').css('td').each do |td|
      royals << td.text
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
