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
    puts "Batting Date Collected"
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
      puts 'CSV file created and saved'
  end

  desc "Turn Batting CSV file batting stats in hash of team key and war values"
  task turn_batting_csv_into_batting_hash: :environment do

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

    puts @filtered_batting_data

  end

end
