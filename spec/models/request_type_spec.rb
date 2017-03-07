require 'rails_helper'

RSpec.describe RequestType, type: :model do
  let(:request_type) { build(:request_type) }

  it 'is valid' do
    expect(request_type).to be_valid
  end
end
