require 'rails_helper'

RSpec.describe Rt::ProjectPublishing, type: :model do
  let(:project_publishing) { build(:project_publishing) }

  it 'is valid' do
    expect(project_publishing).to be_valid
  end
end
