namespace :fetch_batting_stats do

  desc "Collect Batting War Stats"
  task collect_batting_stats: :environment do

    require 'open-uri'
    require 'nokogiri'

    url = "https://www.fangraphs.com/leaders.aspx?pos=all&stats=bat&lg=all&qual=0&type=8&season=2018&month=0&season1=2018&ind=0&team=0,ts&rost=&age=&filter=&players=0"
    document = open(url)
    content =  document.read
    @parsed_content = Nokogiri::HTML(content)

    @unsorted_batting_data = Array.new

    @parsed_content.css('.grid_line_regular').css('td').each do |td|
      @unsorted_batting_data << td.text
    end

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
    require 'csv'

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
    BattingStat.where(team_batting: "Mariners").update(batting_war: @filtered_batting_data["Mariners"])
    BattingStat.where(team_batting: "Astros").update(batting_war: @filtered_batting_data["Astros"])
    BattingStat.where(team_batting: "Angels").update(batting_war: @filtered_batting_data["Angels"])
    BattingStat.where(team_batting: "Athletics").update(batting_war: @filtered_batting_data["Athletics"])
    BattingStat.where(team_batting: "Rangers").update(batting_war: @filtered_batting_data["Rangers"])
    BattingStat.where(team_batting: "Yankees").update(batting_war: @filtered_batting_data["Yankees"])
    BattingStat.where(team_batting: "Red Sox").update(batting_war: @filtered_batting_data["Red Sox"])
    BattingStat.where(team_batting: "Blue Jays").update(batting_war: @filtered_batting_data["Blue Jays"])
    BattingStat.where(team_batting: "Rays").update(batting_war: @filtered_batting_data["Rays"])
    BattingStat.where(team_batting: "Orioles").update(batting_war: @filtered_batting_data["Orioles"])
    BattingStat.where(team_batting: "Twins").update(batting_war: @filtered_batting_data["Twins"])
    BattingStat.where(team_batting: "Tigers").update(batting_war: @filtered_batting_data["Tigers"])
    BattingStat.where(team_batting: "Royals").update(batting_war: @filtered_batting_data["Royals"])
    BattingStat.where(team_batting: "White Sox").update(batting_war: @filtered_batting_data["White Sox"])
    BattingStat.where(team_batting: "Indians").update(batting_war: @filtered_batting_data["Indians"])
    BattingStat.where(team_batting: "Mets").update(batting_war: @filtered_batting_data["Mets"])
    BattingStat.where(team_batting: "Braves").update(batting_war: @filtered_batting_data["Braves"])
    BattingStat.where(team_batting: "Marlins").update(batting_war: @filtered_batting_data["Marlins"])
    BattingStat.where(team_batting: "Nationals").update(batting_war: @filtered_batting_data["Nationals"])
    BattingStat.where(team_batting: "Phillies").update(batting_war: @filtered_batting_data["Phillies"])
    BattingStat.where(team_batting: "Reds").update(batting_war: @filtered_batting_data["Reds"])
    BattingStat.where(team_batting: "Cardinals").update(batting_war: @filtered_batting_data["Cardinals"])
    BattingStat.where(team_batting: "Cubs").update(batting_war: @filtered_batting_data["Cubs"])
    BattingStat.where(team_batting: "Brewers").update(batting_war: @filtered_batting_data["Brewers"])
    BattingStat.where(team_batting: "Pirates").update(batting_war: @filtered_batting_data["Pirates"])
    BattingStat.where(team_batting: "Rockies").update(batting_war: @filtered_batting_data["Rockies"])
    BattingStat.where(team_batting: "Giants").update(batting_war: @filtered_batting_data["Giants"])
    BattingStat.where(team_batting: "Dodgers").update(batting_war: @filtered_batting_data["Dodgers"])
    BattingStat.where(team_batting: "Padres").update(batting_war: @filtered_batting_data["Padres"])
    BattingStat.where(team_batting: "Diamondbacks").update(batting_war: @filtered_batting_data["Diamondbacks"])
  end
end
