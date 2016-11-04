FactoryGirl.define do
  factory :message do
    user
    contact
    body "Hello world! #{Time.now}"
  end
end
