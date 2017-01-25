require 'rails_helper'

describe RtVolunteerSubscribe, type: :model do
  let(:rt_volunteer_subscribe) { create(:rt_volunteer_subscribe) }
  it "should be valid" do
    expect(rt_volunteer_subscribe).to be_valid
  end

  it "should not be valid without an email" do
  	rt_volunteer_subscribe.email=nil
    expect(rt_volunteer_subscribe).to_not be_valid
  end

  it "should not be valid without an email valid" do
  	rt_volunteer_subscribe.email="perezljl"
    expect(rt_volunteer_subscribe).to_not be_valid
  end

  it "should not be valid without an last_name" do
  	rt_volunteer_subscribe.last_name=nil
    expect(rt_volunteer_subscribe).to_not be_valid
  end

  it "should not be valid without an name" do
  	rt_volunteer_subscribe.name=nil
    expect(rt_volunteer_subscribe).to_not be_valid
  end

  
end
