require 'rails_helper'

RSpec.describe BattingStat, type: :model do
 describe 'attributes' do
 it 'has an ops and a name' do
 ops = 0.789
 team_name = BattingStat.create(team_batting: 'mariners')
 expect(team_name.team_batting).to eq('mariners')
 end
 end
end
