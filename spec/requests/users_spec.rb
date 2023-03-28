require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get users_path }

    it 'User should be successful' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
     expect(response).to render_template('index')
   end
  end
end
