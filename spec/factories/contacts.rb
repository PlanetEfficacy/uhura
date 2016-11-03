FactoryGirl.define do
  factory :contact do
    default true
    phone_number { Faker::PhoneNumber.phone_number }
    association :contactable, factory: :student
  end
end
