class Team < ApplicationRecord

  def self.search(search)

    if search
      where(["name ILIKE ?","%#{search}%"])
    else
      all
    end
  end

teambattingwar = Array.new

  def self.teambattingwar
    CSV.foreach("teambattingwar.csv", "r:bom|utf-8") do |row|
    teambattingwar << row[19]
    updatebattingwar = teambattingwar.drop(1)



    updatebattingwar.collect |war|
      war.to_f

      war.inject{ |sum, el| sum + el } /war.size
      possibly puts result here?

      now need to tie values to specific teams
    end
  end

end
