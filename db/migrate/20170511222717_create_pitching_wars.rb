class CreatePitchingWars < ActiveRecord::Migration[5.0]
  def change
    create_table :pitching_wars do |t|

      t.timestamps
    end
  end
end
