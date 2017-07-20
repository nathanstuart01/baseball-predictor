class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :home_team
      t.string :away_team
      t.datetime :game_info

      t.timestamps
    end
  end
end
