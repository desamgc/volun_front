require 'rails_helper'

RSpec.describe RoadType, type: :model do
  let(:road_type) { build(:road_type) }

  it 'is valid2' do
    expect(road_type).to be_valid
  end
end
