class AddTeamsToBattingStats < ActiveRecord::Migration[5.0]
  def change
    add_reference :batting_stats, :team, foreign_key: true
  end
end
