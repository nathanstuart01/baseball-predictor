namespace :fetch_pitching_stats do

  desc "Collect Pitching War Stats"
  task collect_pitching_stats: :environment do

    require 'open-uri'
    require 'nokogiri'

    pitching_url = "https://www.fangraphs.com/leaders.aspx?pos=all&stats=pit&lg=all&qual=0&type=8&season=2018&month=0&season1=2018&ind=0&team=0,ts&rost=0&age=0&filter=&players=0"
    pitching_document = open(pitching_url)
    pitching_content =  pitching_document.read
    @parsed_pitching_content = Nokogiri::HTML(pitching_content)

    @unsorted_pitching_data = Array.new

    @parsed_pitching_content.css('.rgRow').css('td').each do |td|
      @unsorted_pitching_data << td.text
    end

    @parsed_pitching_content.css('.rgAltRow').css('td').each do |td|
      @unsorted_pitching_data << td.text
  end
end

  desc "Save Pitching War Stats to CSV"
  task save_pitching_stats_to_csv: :environment do
    require 'csv'

    CSV.open('pitching_war_test.csv', 'wb') do |csv|
      csv << @unsorted_pitching_data[0..18]
      csv << @unsorted_pitching_data[19..37]
      csv << @unsorted_pitching_data[38..56]
      csv << @unsorted_pitching_data[57..75]
      csv << @unsorted_pitching_data[76..94]
      csv << @unsorted_pitching_data[95..113]
      csv << @unsorted_pitching_data[114..132]
      csv << @unsorted_pitching_data[133..151]
      csv << @unsorted_pitching_data[152..170]
      csv << @unsorted_pitching_data[171..189]
      csv << @unsorted_pitching_data[190..208]
      csv << @unsorted_pitching_data[209..227]
      csv << @unsorted_pitching_data[228..246]
      csv << @unsorted_pitching_data[247..265]
      csv << @unsorted_pitching_data[266..284]
      csv << @unsorted_pitching_data[285..303]
      csv << @unsorted_pitching_data[304..322]
      csv << @unsorted_pitching_data[323..341]
      csv << @unsorted_pitching_data[342..360]
      csv << @unsorted_pitching_data[361..379]
      csv << @unsorted_pitching_data[380..398]
      csv << @unsorted_pitching_data[399..417]
      csv << @unsorted_pitching_data[418..436]
      csv << @unsorted_pitching_data[437..455]
      csv << @unsorted_pitching_data[456..474]
      csv << @unsorted_pitching_data[475..493]
      csv << @unsorted_pitching_data[494..512]
      csv << @unsorted_pitching_data[513..531]
      csv << @unsorted_pitching_data[532..550]
      csv << @unsorted_pitching_data[551..569]
      end
  end

 desc "Turn Pitching CSV file pitching stats in hash of team key and pitching war values and save to DB"
 task turn_pitching_csv_into_pitching_data: :environment do
   require 'csv'

   @raw_csv_pitching_data = Array.new
   @pitching_teams = Array.new
   @pitching_war_strings = Array.new
   @pitching_war_float = Array.new


   CSV.foreach('pitching_war_test.csv') do |row|
     @raw_csv_pitching_data << row[1,18]
   end

   @pitching_teams = @raw_csv_pitching_data.map { |team| team[0] }

   @pitching_war_strings = @raw_csv_pitching_data.map { |war| war[17] }

   @pitching_war_float = @pitching_war_strings.collect do |war|
     war.to_f
   end

   @filtered_pitching_data = [@pitching_teams, @pitching_war_float].transpose.to_h
  end

  desc "Save pitching hash data into db"
  task pitching_hash_into_db: :environment do
    PitchingStat.where(team_pitching: "Mariners").update(pitching_war: @filtered_pitching_data["Mariners"])
    PitchingStat.where(team_pitching: "Astros").update(pitching_war: @filtered_pitching_data["Astros"])
    PitchingStat.where(team_pitching: "Angels").update(pitching_war: @filtered_pitching_data["Angels"])
    PitchingStat.where(team_pitching: "Rangers").update(pitching_war: @filtered_pitching_data["Rangers"])
    PitchingStat.where(team_pitching: "Athletics").update(pitching_war: @filtered_pitching_data["Athletics"])
    PitchingStat.where(team_pitching: "Tigers").update(pitching_war: @filtered_pitching_data["Tigers"])
    PitchingStat.where(team_pitching: "Indians").update(pitching_war: @filtered_pitching_data["Indians"])
    PitchingStat.where(team_pitching: "Royals").update(pitching_war: @filtered_pitching_data["Royals"])
    PitchingStat.where(team_pitching: "Twins").update(pitching_war: @filtered_pitching_data["Twins"])
    PitchingStat.where(team_pitching: "White Sox").update(pitching_war: @filtered_pitching_data["White Sox"])
    PitchingStat.where(team_pitching: "Yankees").update(pitching_war: @filtered_pitching_data["Yankees"])
    PitchingStat.where(team_pitching: "Red Sox").update(pitching_war: @filtered_pitching_data["Red Sox"])
    PitchingStat.where(team_pitching: "Blue Jays").update(pitching_war: @filtered_pitching_data["Blue Jays"])
    PitchingStat.where(team_pitching: "Orioles").update(pitching_war: @filtered_pitching_data["Orioles"])
    PitchingStat.where(team_pitching: "Rays").update(pitching_war: @filtered_pitching_data["Rays"])
    PitchingStat.where(team_pitching: "Braves").update(pitching_war: @filtered_pitching_data["Braves"])
    PitchingStat.where(team_pitching: "Mets").update(pitching_war: @filtered_pitching_data["Mets"])
    PitchingStat.where(team_pitching: "Phillies").update(pitching_war: @filtered_pitching_data["Phillies"])
    PitchingStat.where(team_pitching: "Marlins").update(pitching_war: @filtered_pitching_data["Marlins"])
    PitchingStat.where(team_pitching: "Nationals").update(pitching_war: @filtered_pitching_data["Nationals"])
    PitchingStat.where(team_pitching: "Reds").update(pitching_war: @filtered_pitching_data["Reds"])
    PitchingStat.where(team_pitching: "Cardinals").update(pitching_war: @filtered_pitching_data["Cardinals"])
    PitchingStat.where(team_pitching: "Cubs").update(pitching_war: @filtered_pitching_data["Cubs"])
    PitchingStat.where(team_pitching: "Brewers").update(pitching_war: @filtered_pitching_data["Brewers"])
    PitchingStat.where(team_pitching: "Pirates").update(pitching_war: @filtered_pitching_data["Pirates"])
    PitchingStat.where(team_pitching: "Dodgers").update(pitching_war: @filtered_pitching_data["Dodgers"])
    PitchingStat.where(team_pitching: "Giants").update(pitching_war: @filtered_pitching_data["Giants"])
    PitchingStat.where(team_pitching: "Diamondbacks").update(pitching_war: @filtered_pitching_data["Diamondbacks"])
    PitchingStat.where(team_pitching: "Padres").update(pitching_war: @filtered_pitching_data["Padres"])
    PitchingStat.where(team_pitching: "Rockies").update(pitching_war: @filtered_pitching_data["Rockies"])

  end
end
