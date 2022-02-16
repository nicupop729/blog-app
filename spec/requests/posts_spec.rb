require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'get base page' do
      get '/users/213/posts'
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response.body).to include('213')
    end

    it 'get a specific blog of an user' do
      get '/users/1998/posts/362'
      expect(response).to have_http_status(200)
      expect(response.body).to include('1998')
      expect(response.body).to include('362')
    end
  end
end
