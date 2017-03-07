require 'rails_helper'

RSpec.describe Rt::ActivityUnpublishing, type: :model do
  let(:activity_unpublishing) { build(:activity_unpublishing) }

  it 'is valid' do
    expect(activity_unpublishing).to be_valid
  end
end
