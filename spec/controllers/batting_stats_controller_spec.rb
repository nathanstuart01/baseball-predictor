require 'rails_helper'

RSpec.describe BattingStatsController, type: :controller do

 describe "GET #scrape_espn" do
   it "returns http success" do
     get :scrape_espn
     expect(response).to have_http_status(:success)
   end

   it 'sets the battingstats instance variable' do
     get :scrape_espn
     expect(assigns(:battingstats)).to eq([])
   end

   it 'renders the scrape_espn template' do
     get :scrape_espn
     expect(response).to render_template(:scrape_espn)
   end

   it 'has batting stats in the batting stats instance variable' do
     3.times { |scrape_espn| BattingStat.create(ops: 10, team_batting: 'mariners') }
     get :scrape_espn
     expect(assigns(:battingstats).length).to eq(3)
     expect(assigns(:battingstats).last.team_batting).to eq('mariners')
   end
 end
 end
