require 'rails_helper'

RSpec.describe Rt::VolunteerSubscribe, type: :model do
  let(:volunteer_subscribe) { build(:volunteer_subscribe) }

  it 'is valid' do
    expect(volunteer_subscribe).to be_valid
  end


  it "should not be valid without an email" do
    volunteer_subscribe.email=nil
    expect(volunteer_subscribe).to_not be_valid
  end

  it "should not be valid without an email valid" do
    volunteer_subscribe.email="perezljl"
    expect(volunteer_subscribe).to_not be_valid
  end

  it "should not be valid without an last_name" do
    volunteer_subscribe.last_name=nil
    expect(volunteer_subscribe).to_not be_valid
  end

  it "should not be valid without an name" do
    volunteer_subscribe.name=nil
    expect(volunteer_subscribe).to_not be_valid
  end
end
