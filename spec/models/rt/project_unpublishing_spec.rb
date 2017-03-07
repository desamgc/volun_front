require 'rails_helper'

RSpec.describe Rt::ProjectUnpublishing, type: :model do
  let(:project_unpublishing) { build(:project_unpublishing) }

  it 'is valid' do
    expect(project_unpublishing).to be_valid
  end
end
