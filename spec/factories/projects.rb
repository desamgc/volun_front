FactoryGirl.define do
  factory :project do
    name "MyString"
    active false
    description "MyText"
    functions "MyString"
    execution_start_date "2016-11-29"
    execution_end_date "2016-11-29"
    contact_name "MyString"
    contact_first_surname "MyString"
    contact_second_surname "MyString"
    phone_number "MyString"
    email "MyString"
    comments "MyText"
    beneficiaries_num 1
    volunteers_num 1
    insured false
    insurance_date "2016-11-29"
    project_type nil
    entity nil
  end
end
