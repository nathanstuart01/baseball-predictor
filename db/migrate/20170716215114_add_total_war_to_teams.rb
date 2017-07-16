class AddTotalWarToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :total_war, :float
  end
end
