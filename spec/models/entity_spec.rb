require 'rails_helper'

RSpec.describe 'Entity', type: :model do
  user = User.new(name: 'Ibnballo')
  subject { Entity.new(user:, name: 'Rice', amount: 120.0) }

  it 'name should be Rice' do
    expect(subject.name).to eq('Rice')
  end
end
