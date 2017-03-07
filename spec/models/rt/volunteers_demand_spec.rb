require 'rails_helper'

RSpec.describe Rt::VolunteersDemand, type: :model do
  let(:volunteers_demand) { build(:volunteers_demand) }

  it 'is valid' do
    expect(volunteers_demand).to be_valid
  end
end
