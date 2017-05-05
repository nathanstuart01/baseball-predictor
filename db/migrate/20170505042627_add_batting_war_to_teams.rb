class AddBattingWarToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :batting_war, :float
  end
end
