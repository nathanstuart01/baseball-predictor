class AddTeamsToPitchingStats < ActiveRecord::Migration[5.0]
  def change
    add_reference :pitching_stats, :team, foreign_key: true
  end
end
