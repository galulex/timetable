Factory.define :dispatcher do |d|
  d.email { Faker::Internet.email }
  d.first_name { Faker::Name.first_name }
  d.last_name { Faker::Name.last_name }
  d.password 'Password2012'
  d.password_confirmation 'Password2012'
  d.approved true
end
