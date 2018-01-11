require 'rails_helper'

RSpec.describe AreasProject, type: :model do
  let(:areas_project) { build(:areas_project) }

  it 'is valid2' do
    expect(areas_project).to be_valid
  end
end
