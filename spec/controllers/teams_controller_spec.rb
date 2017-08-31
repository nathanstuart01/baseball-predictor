require 'rails_helper'

RSpec.describe TeamsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
    get :index
    expect(response).to have_http_status(:success)
  end

    it 'sets the teams instance variable' do
    get :index
    expect(assigns(:teams)).to eq([])
  end

  it 'renders the index template' do
  get :index
  expect(response).to render_template(:index)
end




end
end
