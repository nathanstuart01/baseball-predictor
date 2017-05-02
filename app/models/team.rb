class Team < ApplicationRecord

  def self.search(search)
    if search
      where(["name LIKE ?","%#{search}%"])
    else
      where
    end
  end

end
