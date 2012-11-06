FactoryGirl.define do
  factory :dispatcher do
  email { Faker::Internet.email }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  password 'Password2012'
  password_confirmation 'Password2012'
  end
end
