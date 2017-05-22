namespace :fetch_batting_stats do

  desc "Collect Batting War Stats"
  task collect_batting_stats: :environment do

    require 'open-uri'
    require 'nokogiri'

    url = "http://www.fangraphs.com/leaders.aspx?pos=all&stats=bat&lg=all&qual=0&type=8&season=2017&month=0&season1=2017&ind=0&team=0,ts&rost=&age=&filter=&players=0"
    document = open(url)
    content =  document.read
    @parsed_content = Nokogiri::HTML(content)

    @unsorted_batting_data = Array.new

    @parsed_content.css('.grid_line_regular').css('td').each do |td|
      @unsorted_batting_data << td.text
    end
    #BattingStat.create(ops: @nationals.last.to_f, team_batting: 'nationals')
  end

  desc "Save Batting War Stats to CSV"
  task save_batting_stats_to_csv: :environment do
    require 'csv'

    CSV.open('batting_war_test.csv', 'wb') do |csv|
      csv << @unsorted_batting_data[0..16]
      csv << @unsorted_batting_data[17..33]
      csv << @unsorted_batting_data[34..50]
      csv << @unsorted_batting_data[51..67]
      csv << @unsorted_batting_data[68..84]
      csv << @unsorted_batting_data[85..101]
      csv << @unsorted_batting_data[102..118]
      csv << @unsorted_batting_data[119..135]
      csv << @unsorted_batting_data[136..152]
      csv << @unsorted_batting_data[153..169]
      csv << @unsorted_batting_data[170..186]
      csv << @unsorted_batting_data[187..203]
      csv << @unsorted_batting_data[204..220]
      csv << @unsorted_batting_data[221..237]
      csv << @unsorted_batting_data[238..254]
      csv << @unsorted_batting_data[255..271]
      csv << @unsorted_batting_data[272..288]
      csv << @unsorted_batting_data[289..305]
      csv << @unsorted_batting_data[306..322]
      csv << @unsorted_batting_data[323..339]
      csv << @unsorted_batting_data[340..356]
      csv << @unsorted_batting_data[357..373]
      csv << @unsorted_batting_data[374..390]
      csv << @unsorted_batting_data[391..407]
      csv << @unsorted_batting_data[408..424]
      csv << @unsorted_batting_data[425..441]
      csv << @unsorted_batting_data[442..458]
      csv << @unsorted_batting_data[459..475]
      csv << @unsorted_batting_data[476..492]
      csv << @unsorted_batting_data[493..509]
      end
  end

  desc "Turn Batting CSV file batting stats in hash of team key and war values and save to DB"
  task turn_batting_csv_into_batting_data: :environment do

    @raw_csv_batting_data = Array.new
    @batting_teams = Array.new
    @batting_war_strings = Array.new
    @batting_war_float = Array.new


    CSV.foreach('batting_war_test.csv') do |row|
      @raw_csv_batting_data << row[0,17]
    end

    @batting_teams = @raw_csv_batting_data.map { |team| team[1] }

    @batting_war_strings = @raw_csv_batting_data.map { |war| war[16] }

    @batting_war_float = @batting_war_strings.collect do |war|
      war.to_f
    end

    @filtered_batting_data = [@batting_teams, @batting_war_float].transpose.to_h


  end

  desc "Save batting hash data into db"
  task batting_hash_into_db: :environment do
    BattingStat.create(team_batting: @filtered_batting_data.keys[0], war: @filtered_batting_data.values[0])
    BattingStat.create(team_batting: @filtered_batting_data.keys[1], war: @filtered_batting_data.values[1])
    BattingStat.create(team_batting: @filtered_batting_data.keys[2], war: @filtered_batting_data.values[2])
    BattingStat.create(team_batting: @filtered_batting_data.keys[3], war: @filtered_batting_data.values[3])
    BattingStat.create(team_batting: @filtered_batting_data.keys[4], war: @filtered_batting_data.values[4])
    BattingStat.create(team_batting: @filtered_batting_data.keys[5], war: @filtered_batting_data.values[5])
    BattingStat.create(team_batting: @filtered_batting_data.keys[6], war: @filtered_batting_data.values[6])
    BattingStat.create(team_batting: @filtered_batting_data.keys[7], war: @filtered_batting_data.values[7])
    BattingStat.create(team_batting: @filtered_batting_data.keys[8], war: @filtered_batting_data.values[8])
    BattingStat.create(team_batting: @filtered_batting_data.keys[9], war: @filtered_batting_data.values[9])
    BattingStat.create(team_batting: @filtered_batting_data.keys[10], war: @filtered_batting_data.values[10])
    BattingStat.create(team_batting: @filtered_batting_data.keys[11], war: @filtered_batting_data.values[11])
    BattingStat.create(team_batting: @filtered_batting_data.keys[12], war: @filtered_batting_data.values[12])
    BattingStat.create(team_batting: @filtered_batting_data.keys[13], war: @filtered_batting_data.values[13])
    BattingStat.create(team_batting: @filtered_batting_data.keys[14], war: @filtered_batting_data.values[14])
    BattingStat.create(team_batting: @filtered_batting_data.keys[15], war: @filtered_batting_data.values[15])
    BattingStat.create(team_batting: @filtered_batting_data.keys[16], war: @filtered_batting_data.values[16])
    BattingStat.create(team_batting: @filtered_batting_data.keys[17], war: @filtered_batting_data.values[17])
    BattingStat.create(team_batting: @filtered_batting_data.keys[18], war: @filtered_batting_data.values[18])
    BattingStat.create(team_batting: @filtered_batting_data.keys[19], war: @filtered_batting_data.values[19])
    BattingStat.create(team_batting: @filtered_batting_data.keys[20], war: @filtered_batting_data.values[20])
    BattingStat.create(team_batting: @filtered_batting_data.keys[21], war: @filtered_batting_data.values[21])
    BattingStat.create(team_batting: @filtered_batting_data.keys[22], war: @filtered_batting_data.values[22])
    BattingStat.create(team_batting: @filtered_batting_data.keys[23], war: @filtered_batting_data.values[23])
    BattingStat.create(team_batting: @filtered_batting_data.keys[24], war: @filtered_batting_data.values[24])
    BattingStat.create(team_batting: @filtered_batting_data.keys[25], war: @filtered_batting_data.values[25])
    BattingStat.create(team_batting: @filtered_batting_data.keys[26], war: @filtered_batting_data.values[26])
    BattingStat.create(team_batting: @filtered_batting_data.keys[27], war: @filtered_batting_data.values[27])
    BattingStat.create(team_batting: @filtered_batting_data.keys[28], war: @filtered_batting_data.values[28])
    BattingStat.create(team_batting: @filtered_batting_data.keys[29], war: @filtered_batting_data.values[29])

  end


end
