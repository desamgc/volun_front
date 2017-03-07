require 'rails_helper'

RSpec.describe Rt::ActivityPublishing, type: :model do
  let(:activity_publishing) { build(:activity_publishing) }

  it 'is valid' do
    expect(activity_publishing).to be_valid
  end
end
