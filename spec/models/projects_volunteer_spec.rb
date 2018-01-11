require 'rails_helper'

RSpec.describe ProjectsVolunteer, type: :model do
  let(:projects_volunteer) { build(:projects_volunteer) }

  it 'is valid2' do
    expect(projects_volunteer).to be_valid
  end
end
