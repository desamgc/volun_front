require 'rails_helper'

RSpec.describe Rt::VolunteerAppointment, type: :model do
  let(:volunteer_appointment) { build(:volunteer_appointment) }

  it 'is valid' do
    expect(volunteer_appointment).to be_valid
  end
end
