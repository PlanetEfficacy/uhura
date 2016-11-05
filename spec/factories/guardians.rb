FactoryGirl.define do
  factory :guardian do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    language_code "es"
    primary false
    relationship
  end
end
