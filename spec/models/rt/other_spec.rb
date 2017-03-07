require 'rails_helper'

RSpec.describe Rt::Other, type: :model do
  let(:other) { build(:rt_other) }

  it 'is valid' do
    expect(other).to be_valid
  end
end
