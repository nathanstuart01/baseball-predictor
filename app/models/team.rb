class Team < ApplicationRecord

  def self.search(search)

    if search
      where(["name ILIKE ?","%#{search}%"])
    else
      all
    end
  end

end
