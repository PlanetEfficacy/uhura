FactoryGirl.define do
  factory :user do
    provider "google"
    uid { Faker::Number.number(10) }
    name { "#{Faker::Name.first_name} #{Faker::Name.last_name }" }
    email { Faker::Internet.email }
    first_name { name.split(' ')[0] }
    last_name { name.split(' ')[1] }
    image { Faker::Avatar.image("my-own-slug", "32x32") }
    urls { Faker::Internet.url }
    token { Faker::Crypto.md5 }
    refresh_token { Faker::Crypto.md5 }
    expires_at { Faker::Time.forward(1, :morning) }
    expires true
  end
end
