class RemovePitchingWarFromTeams < ActiveRecord::Migration[5.0]
  def change
    remove_column :teams, :pitching_war, :float
  end
end
