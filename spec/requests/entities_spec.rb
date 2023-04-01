require 'rails_helper'

RSpec.describe 'Entities', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET /new' do
    before do
      @user = User.create(name: 'Ibnballo', email: 'ibnballo@gmail.com', password: '08174355135')
      sign_in @user
      @group = Group.create(name: 'Food', icon: 'photo.png', user_id: @user.id)
      get new_group_entity_path(group_id: Group.first.id)
    end

    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end
