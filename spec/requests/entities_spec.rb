require 'rails_helper'

RSpec.describe 'Entities', type: :request do
  describe 'GET /index' do
    before(:example) do
      @user = User.create(name: 'Ibnballo')
      @entity = Entity.create(user: @user, name: 'Rice', amount: 120.0)
    end

    it 'Entity should be successful' do
      get user_entities_path(@user)
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      get user_entities_path(@user)
      expect(response).to render_template('index')
    end
  end

  describe 'GET /show' do
    before(:example) do
      @user = User.create(name: 'Ibnballo')
      @entity = Entity.create(user: @user, name: 'Rice', amount: 120.0)
    end

    it 'User should be successful' do
      get user_entities_path(@user, @entity)
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      get user_entity_path(@user, @entity)
      expect(response).to render_template('show')
    end
  end
end
