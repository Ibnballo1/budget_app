require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET /new' do
    before do
      @user = User.create(name: 'Ibnballo', email: 'ibnballo@gmail.com', password: '08174355134')
      sign_in @user
      get new_group_path
    end

    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
  end

  describe 'GET /index' do
    before(:each) do
      @user = User.create(name: 'Ibnballo', email: 'ibnballo@gmail.com', password: '08174355135')

      @group = Group.create(user_id: @user.id, name: 'pizza',
                                  icon: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-Qz_PXUP8Lsb3k6b6tTASlpGQYYCURKlmBA&usqp=CAU')
      sign_in @user
      get new_group_path
    end

    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end
