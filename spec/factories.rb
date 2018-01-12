FactoryGirl.define do
  factory :areas_project do

  end
  factory :pt_other, class: 'Pt::Other' do

  end
  factory :pt do

  end
  factory :projects_volunteer do

  end
  factory :image do

  end
  factory :road_type do
    name 'calle'
    code 1
  end

  factory :area do
    name "cultura"
    trait :cultura do
      name "cultura"
      description "cultura"
      active true
    end
    trait :deportes do
      name "deportes"
      description "deportes"
      active true
    end
  end

  factory :notice_type do
    kind 1
    description "MyText"
    active false
  end

  factory :entity_type do
    description Faker::Lorem.name
    name        Faker::Lorem.name
    active true
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
    execution_hour "10:10"
    road_type "ss"
    road_name "MyString"
    number_type "MyString"
    road_number "MyString"
    postal_code "28040"
    borough "MyString"
    town "MyString"
    province "ss"
    dates_text_free "MyString"
    hours_text_free "MyString"
    places_text_free "MyString"
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
    vat_number "52755658y"
    email "perezljl@madrid.es"
    representative_name "MyString"
    representative_last_name "MyString"
    representative_last_name_alt "MyString"
    contact_name "MyString"
    contact_last_name "MyString"
    contact_last_name_alt "MyString"
    phone_number "915133368"
    phone_number_alt "915133368"
    publish_pictures false
    annual_survey false
    association :entity_type
    comments "MyText"
    other_subscribe_reason "MyText"
    road_type  "mystring"
    road_name "MyString"
    road_number_type "MyString"
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
    association :project, factory: :project, strategy: :create
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
    notes  "notas"

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
    notes "notas"
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
    email Faker::Internet.email

    trait :invalid do
      email ""
    end
  end

  factory :volunteer_unsubscribe, class: 'Rt::VolunteerUnsubscribe' do
    notes "notes"
    association :project, factory: :project, strategy: :build
    association :unsubscribe_level, factory: :unsubscribe_level, strategy: :build

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
    district              Faker::Address.state
    normalize             false
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
    sequence(:name)     { |n| "Entidad #{n} name" }
    email Faker::Internet.email
    phone_number  "915133368"
    vat_number       "04959973T"
    representative_name Faker::Lorem.name
    representative_last_name Faker::Lorem.name
    contact_name Faker::Lorem.name
    contact_last_name Faker::Lorem.name
    entity_type_id 1
    req_reason_id 1
    #association :entity_type, factory: :entity_type
    association :address, factory: :address
    #association :req_reason, factory: :req_reason
    trait :invalid do
      email ""
    end
  end



  factory :project do
      sequence(:name)       { |n| "Project #{n} name" }
      description           Faker::Lorem.sentence
      functions             Faker::Lorem.sentence
      comments              Faker::Lorem.sentence
      association           :entity, factory: :entity
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
      pt_extendable_id      1
      pt_extendable_type    'Pt::Social'
      #association           :pt_extendable, factory: :pt_social
      outstanding           false
      trait :project_social do
       association           :pt_extendable, factory: :pt_social
      end
      trait :user_entity do
         association           :pt_extendable, factory: :pt_entity
      end

      trait :featured do
         outstanding    true
      end

      trait :nopublic do
          active false
          publish false
      end

  end

  factory :project_social, class: 'Project' do
      sequence(:name)       { |n| "Project social #{n} name" }
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
      outstanding           false
      association           :pt_extendable
  end

  factory :volunteer do
    name Faker::Lorem.name
    last_name "MyString"
    phone_number "915133368"
    email Faker::Internet.email
    association :address, factory: :address
  end

  factory :user do
     email Faker::Internet.email
     password '12345678'
     password_confirmation '12345678'
     notice_type_id 1
     confirmation_token 'MXF8fAef98iVGd5gfpHg'
     confirmed_at '2017-05-18 06:06:47.754827'
     confirmation_sent_at '2017-05-18 06:06:47.754827'
     terms_of_service true
     trait :user_volunteer do
       association  :loggable, factory: :volunteer
     end
     trait :user_entity do
       association  :loggable, factory: :entity
     end
  end


  factory :activity do
      sequence(:name)       { |n| "Actividad #{n} " }
      description   Faker::Lorem.sentence
      start_date    Faker::Time.between(DateTime.now - 10, DateTime.now)
      end_date      Faker::Time.between(DateTime.tomorrow - 10, DateTime.tomorrow)
      active        true
      publish       true
      transport     "transporte"
      #association   :project
  end


  factory :event , class: 'Event' do
      publish       true
      notes "evento 1"
      association   :address, factory: :address
      association   :eventable, factory: :activity
      #after :create do |event|
      #  event.timetables = create_list(:timetable, 2)
      #  event.publish = false
      #end
      trait :no_publish do
        publish  true
      end
  end

  factory :timetable do
      execution_date Faker::Time.between(DateTime.now, DateTime.tomorrow + 1)
      start_hour  "10:00"
      end_hour  "12:00"
      association   :event
  end

  factory :pt_social, class: 'Pt::Social' do
    notes "MyText2"
    trait :invalid do
      notes ""
    end
  end

  factory :unsubscribe_level do
    kind "project"
    description "prueba"
    trait :invalid do
      notes ""
    end
  end


end
