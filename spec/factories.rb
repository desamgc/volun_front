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

  factory :address do
    postal_code           Faker::Address.postcode
    road_type             1
    road_name             Faker::Address.street_name
    road_number_type      "num"
    road_number           Faker::Number.number(1)
    grader                Address::GRADERS.sample
    stairs                Faker::Number.number(1)
    floor                 Faker::Number.number(1)
    door                  Faker::Number.number(1)
    province              1
    country               "España"
    town                  "Madrid"
    latitude              Faker::Address.latitude 
    longitude             Faker::Address.longitude 
  end
  
  factory :entity do
    name Faker::Lorem.name
    email Faker::Internet.email 
    representative_name Faker::Lorem.name 
    representative_last_name Faker::Lorem.name 
    contact_name Faker::Lorem.name 
    contact_last_name Faker::Lorem.name
    entity_type_id 1 
    association :address, factory: :address 
  end

  

  factory :project do
      name                  Faker::App.name
      description           Faker::Lorem.sentence
      functions             Faker::Lorem.sentence
      comments              Faker::Lorem.sentence
      association :entity, factory: :entity
      execution_start_date  Faker::Time.between(DateTime.now - 10, DateTime.now)
      execution_end_date    Faker::Time.between(DateTime.tomorrow - 10, DateTime.tomorrow)
      phone_number          Faker::PhoneNumber.phone_number
      email                 Faker::Internet.email
      beneficiaries_num     10
      volunteers_num        20
      project_type_id       1
      insured               true
      active                true
      publish               true
      contact_name          Faker::Lorem.name  
      contact_last_name     Faker::Lorem.name
                

  end

  factory :volunteer do
    name "jose"
    last_name "MyString"
    phone_number "MyString"
    email "perezljl@madrid.es"
    association :address, factory: :address 
  end

  factory :user do
     email 'voluntario@madrid.es'
     password '12345678'
     password_confirmation '12345678' 
     association  :loggable, factory: :volunteer
     notice_type_id 1
  end  
  
end
