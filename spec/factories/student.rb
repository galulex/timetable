FactoryGirl.define do
  factory :student do

    email  Faker::Internet.email
    first_name  Faker::Name.first_name
    last_name  Faker::Name.last_name
    facebook_id { rand(1000) }
    token 'token'
  end
end
