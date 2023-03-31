require 'rails_helper'

RSpec.describe 'Group', type: :model do
  subject { Group.new(name: 'Food Stuff', icon: 'FoodIcon') }

  it 'icon should be valid' do
    subject.icon = 'FoodIcon'
    expect(subject.icon).to eq('FoodIcon')
  end
end
