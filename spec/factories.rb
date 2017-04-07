FactoryGirl.define do
  
  factory :notice_type do
    kind 1
    description "MyText"
    active false
  end

  factory :entity_type do
    description "MyText"
    name "MyText"
    active false
  end

  sequence(:document_number) { |n| "#{n.to_s.rjust(8, '0')}X" }


 
  factory :request_type do
    kind 1
    description "MyText"
    active true

    trait :invalid do
      association :kind
    end
  end
  
  
  factory :req_reason do
    kind 1
    description "MyText"
    active true
    name "MyText"

    trait :invalid do
      association :kind
    end
  end
  

  factory :req_rejection_type do
    kind 1
    description "MyText"
    name "MyText"
    active true

    trait :invalid do
      association :kind
    end
  end
    
 factory :request_form do
    #request_type 1 #RequestType.get_request_form_type(self.rt_extendable_type)
    #sent_at "2016-12-02 12:48:05"
    #status 1
    #status_date "2016-12-02 12:48:05"
    #rejection_type nil
    #comments "MyText"

    association :request_type
    rt_extendable_id 1
    rt_extendable_type 'Rt::VolunteerSubscribe'
    association :user
    status 1
    status_date "2017-01-27 10:42:03"
    association :req_rejection_type
    association :req_reason
    comments "MyText"

  end

  
  factory :activity_publishing, class: 'Rt::ActivityPublishing' do
    name "MyString"
    organizer "MyString"
    description "MyText"
    execution_date "2017-01-27"
    execution_hour "MyString"
    road_type "ss" 
    road_name "MyString"
    number_type "MyString"
    road_number "MyString"
    postal_code "28040"
    borough "MyString"
    town "MyString"
    province "ss"
    #association :project 

    trait :invalid do
      name ""
    end
  end

  factory :activity_unpublishing, class: 'Rt::ActivityUnpublishing' do
    association :activity
    notes "MyText"

    trait :invalid do
      notes ""
    end
  end

  factory :entity_unsubscribe, class: 'Rt::EntityUnsubscribe' do
    notes "MyText"

    trait :invalid do
      notes ""
    end
  end
  factory :entity_subscribe, class: 'Rt::EntitySubscribe' do
    name "MyString"
    description "MyText"
    vat_number "MyString"
    email "perezljl@madrid.es"
    representative_name "MyString"
    representative_last_name "MyString"
    representative_last_name_alt "MyString"
    contact_name "MyString"
    contact_last_name "MyString"
    contact_last_name_alt "MyString"
    phone_number "915133368"
    phone_number_alt "915133368"
    dkd "ddd"
    publish_pictures false
    annual_survey false
    association :entity_type
    comments "MyText"
    other_subscribe_reason "MyText"
    road_type  "mystring"
    road_name "MyString"
    number_type "MyString"
    road_number "MyString"
    postal_code "28040"
    borough "MyString"
    district "distrito"
    town "MyString"
    province "provincia"

    trait :invalid do
       name ""
    end
  end

  factory :project_unsubscribe, class: 'Rt::ProjectUnsubscribe' do
    association :project 
    notes "MyText"

    trait :invalid do
       notes ""
    end
  end
  factory :project_unpublishing, class: 'Rt::ProjectUnpublishing' do
    association :project
    notes "MyText"

    trait :invalid do
      notes ""
    end
  end
  factory :project_publishing, class: 'Rt::ProjectPublishing' do
    description "MyText"
    road_type "sss"
    road_name "MyString"
    number_type "MyString"
    road_number "MyString"
    postal_code "28041"
    borough "MyString"
    district "msms" 
    town "MyString"
    province "sddfd" 

    trait :invalid do
      description ""
    end
  end
  factory :volunteers_demand, class: 'Rt::VolunteersDemand' do
    description "MyText"
    execution_start_date "2017-01-27"
    execution_end_date "2017-01-28"
    road_type "Ddd" 
    road_name "MyString"
    number_type "MyString"
    road_number "MyString"
    postal_code "28045"
    borough "MyString"
    district  "SSS"
    town "MyString"
    province "ssd" 
    requested_volunteers_num "MyString"
    volunteers_profile "MyText"
    volunteer_functions_1 "MyText"
    volunteer_functions_2 "MyText"
    volunteer_functions_3 "MyText"

    trait :invalid do
      description ""
    end
  end
  
  factory :volunteer_appointment, class: 'Rt::VolunteerAppointment' do
    notes "MyText"

    trait :invalid do
      notes ""
    end
  end
  factory :volunteer_amendment, class: 'Rt::VolunteerAmendment' do
    road_type "DD"
    road_name "MyString"
    number_type "MyString"
    road_number "MyString"
    postal_code "28040"
    borough "MyString"
    district "dd"
    town "MyString"
    province "provincia"
    phone_number "915133368"
    phone_number_alt "915133368"
    email "perezljl@madrid.es"

    trait :invalid do
       phone_number "dd" 
    end
  end
  
  factory :volunteer_subscribe, class: 'Rt::VolunteerSubscribe' do
    name "MyString"
    last_name "MyString"
    phone_number "915133368"
    email "perezljl@madrid.es"

    trait :invalid do
      email ""
    end
  end

  factory :volunteer_unsubscribe, class: 'Rt::VolunteerUnsubscribe' do
     notes "MyText"
     descripcion "descripcion"

    trait :invalid do
      notes ""
    end
  end
 
 factory :other, class: 'Rt::Other' do
    description "MyText"

    trait :invalid do
      description ""
    end
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



  factory :road_type do
    name "MyText"

    trait :invalid do
    end
  end
  
  factory :district do
    name "MyText"

    trait :invalid do
    end
  end
  
  factory :province do
    name "MyText"

    trait :invalid do
    end
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


  factory :activity do
      name                  Faker::App.name
      description           Faker::Lorem.sentence
      start_date  Faker::Time.between(DateTime.now - 10, DateTime.now)
      end_date    Faker::Time.between(DateTime.tomorrow - 10, DateTime.tomorrow)
      active                true
      publish               true
     
  end  


  
  

  
end
