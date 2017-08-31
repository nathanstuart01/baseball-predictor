require 'rails_helper'

RSpec.describe TeamsController, type: :controller do

  test "GET #index" do
    get :index
    expect(response).to have_http_status(:success)
  end


end
