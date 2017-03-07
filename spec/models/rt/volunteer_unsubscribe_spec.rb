require 'rails_helper'

RSpec.describe Rt::VolunteerUnsubscribe, type: :model do
  let(:volunteer_unsubscribe) { build(:volunteer_unsubscribe) }

  it 'is valid' do
    expect(volunteer_unsubscribe).to be_valid
  end
end
