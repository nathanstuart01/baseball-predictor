class AddPitchingWarToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :pitching_war, :float
  end
end
