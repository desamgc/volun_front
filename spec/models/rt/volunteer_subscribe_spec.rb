require 'rails_helper'

RSpec.describe Rt::VolunteerSubscribe, type: :model do
  let(:volunteer_subscribe) { build(:volunteer_subscribe) }

  it 'is valid' do
    expect(volunteer_subscribe).to be_valid
  end
end
