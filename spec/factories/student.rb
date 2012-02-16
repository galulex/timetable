Factory.define :student do |s|
  s.email { Faker::Internet.email }
  s.first_name { Faker::Name.first_name }
  s.last_name { Faker::Name.last_name }
  s.facebook_id rand(1000)
  s.token 'token'
end
