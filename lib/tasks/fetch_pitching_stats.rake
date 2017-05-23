namespace :fetch_pitching_stats do

  desc "Collect Pitching War Stats"
  task collect_pitching_stats: :environment do

    require 'open-uri'
    require 'nokogiri'

    pitching_url = "http://www.fangraphs.com/leaders.aspx?pos=all&stats=pit&lg=all&qual=0&type=8&season=2017&month=0&season1=2017&ind=0&team=0,ts&rost=0&age=0&filter=&players=0"
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

   puts @filtered_pitching_data


  end

  desc "Save pitching hash data into db"
  task pitching_hash_into_db: :environment do
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[0], pitching_war: @filtered_pitching_data.values[0])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[15], pitching_war: @filtered_pitching_data.values[15])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[1], pitching_war: @filtered_pitching_data.values[1])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[16], pitching_war: @filtered_pitching_data.values[16])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[2], pitching_war: @filtered_pitching_data.values[2])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[17], pitching_war: @filtered_pitching_data.values[17])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[3], pitching_war: @filtered_pitching_data.values[3])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[18], pitching_war: @filtered_pitching_data.values[18])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[4], pitching_war: @filtered_pitching_data.values[4])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[19], pitching_war: @filtered_pitching_data.values[19])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[5], pitching_war: @filtered_pitching_data.values[5])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[20], pitching_war: @filtered_pitching_data.values[20])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[6], pitching_war: @filtered_pitching_data.values[6])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[21], pitching_war: @filtered_pitching_data.values[21])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[7], pitching_war: @filtered_pitching_data.values[7])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[22], pitching_war: @filtered_pitching_data.values[22])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[8], pitching_war: @filtered_pitching_data.values[8])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[23], pitching_war: @filtered_pitching_data.values[23])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[9], pitching_war: @filtered_pitching_data.values[9])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[24], pitching_war: @filtered_pitching_data.values[24])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[10], pitching_war: @filtered_pitching_data.values[10])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[25], pitching_war: @filtered_pitching_data.values[25])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[11], pitching_war: @filtered_pitching_data.values[11])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[26], pitching_war: @filtered_pitching_data.values[26])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[12], pitching_war: @filtered_pitching_data.values[12])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[27], pitching_war: @filtered_pitching_data.values[27])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[13], pitching_war: @filtered_pitching_data.values[13])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[28], pitching_war: @filtered_pitching_data.values[28])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[14], pitching_war: @filtered_pitching_data.values[14])
    PitchingStat.create(team_pitching: @filtered_pitching_data.keys[29], pitching_war: @filtered_pitching_data.values[29])
  end
end
