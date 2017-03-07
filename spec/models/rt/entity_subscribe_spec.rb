require 'rails_helper'

RSpec.describe Rt::EntitySubscribe, type: :model do
  let(:entity_subscribe) { build(:entity_subscribe) }

  it 'is valid' do
    expect(entity_subscribe).to be_valid
  end
end
