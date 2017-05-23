class RemoveBattingWarFromTeams < ActiveRecord::Migration[5.0]
  def change
    remove_column :teams, :batting_war, :float
  end
end
