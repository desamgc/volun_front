require 'rails_helper'

RSpec.describe Rt::VolunteerAmendment, type: :model do
  let(:volunteer_amendment) { build(:volunteer_amendment) }

  it 'is valid' do
    expect(volunteer_amendment).to be_valid
  end
end
