require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'get index page' do
      get '/'
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
    end

    it "get a user's page" do
      get '/users/3'
      expect(response).to have_http_status(200)
      expect(response.body).to include('3')
    end

    it 'requesting to the /users path should also return the index' do
      get '/users'
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end
end
