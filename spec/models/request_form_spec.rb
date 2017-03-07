require 'rails_helper'

RSpec.describe RequestForm, type: :model do
  let(:request_form) { build(:request_form) }

  it 'is valid' do
    expect(request_form).to be_valid
  end
end
