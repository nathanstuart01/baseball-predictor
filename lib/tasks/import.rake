require 'csv'

namespace :import do

  desc "Import batting WAR from csv"
  task teambattingwar: :environment do
    filename = File.join Rails.root, "teambattingwar.csv"
    CSV.foreach(filename) do |row|
      puts row
    end
  end
end
