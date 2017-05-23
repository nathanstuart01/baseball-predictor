class CreatePitchingStats < ActiveRecord::Migration[5.0]
  def change
    create_table :pitching_stats do |t|
      t.string :team_pitching
      t.float :pitching_war

      t.timestamps
    end
  end
end
