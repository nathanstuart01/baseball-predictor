class CreateBattingStats < ActiveRecord::Migration[5.0]
  def change
    create_table :batting_stats do |t|
      t.string :team_batting
      t.float :batting_war

      t.timestamps
    end
  end
end
