require 'rails_helper'

RSpec.describe Rt::EntityUnsubscribe, type: :model do
  let(:entity_unsubscribe) { build(:entity_unsubscribe) }

  it 'is valid' do
    expect(entity_unsubscribe).to be_valid
  end
end
