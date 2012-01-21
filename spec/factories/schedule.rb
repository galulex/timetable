Factory.define :audience  do |a|
  a.title { Faker::Base.numerify }
  a.association :schedule
end

Factory.define :teacher  do |t|
  t.first_name { Faker::Name.first_name }
  t.last_name { Faker::Name.last_name }
  t.hours { Faker::Base.numerify }
  t.association :schedule
end

Factory.define :group  do |g|
  g.name { Faker::Name.name }
  g.association :teacher
  g.association :schedule
end

Factory.define :lesson do |l|
  l.name { Faker::Name.name }
  l.day_id { Faker::Base.numerify }
  l.association :group
  l.association :schedule
end

Factory.define :schedule_call do |s|
  s.start_at Time.now
  s.association :schedule
end

Factory.define :schedule do |s|
  s.name { Faker::Name.name }
  s.lesson_duration { Faker::Base.numerify }
end
