FactoryGirl.define do
  factory :notice_type do
    kind 1
    description "MyText"
    active false
  end

  sequence(:document_number) { |n| "#{n.to_s.rjust(8, '0')}X" }

 factory :request_form do
    #request_type 1 #RequestType.get_request_form_type(self.rt_extendable_type)
    sent_at "2016-12-02 12:48:05"
    status 1
    status_date "2016-12-02 12:48:05"
    rejection_type nil
    comments "MyText"
  end


  factory :rt_volunteer_subscribe do
    name "MyString"
    last_name "MyString"
    phone_number "915133368"
    email "perezljl@madrid.es"
  end
  
end
