require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'get base page' do
      get '/users/1/posts'
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response.body).to include('1')
    end

    it 'get a specific blog of an user' do
      get '/users/2/posts/1'
      expect(response).to have_http_status(200)
      expect(response.body).to include('2')
      expect(response.body).to include('1')
    end
  end
end
