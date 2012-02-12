Factory.define :audience  do |a|
  a.title rand(120)
  a.association :schedule
end

Factory.define :teacher  do |t|
  t.first_name { Faker::Name.first_name }
  t.last_name { Faker::Name.last_name }
  t.hours rand(100)
  t.association :schedule
end

Factory.define :group  do |g|
  g.name { Faker::Name.name }
  g.association :teacher
  g.association :schedule
end

Factory.define :lesson do |l|
  l.name { Faker::Name.name }
  l.day_id rand(6)
  l.association :group
  l.association :schedule
  l.association :schedule_call
  l.association :teacher
  l.association :audience
end

Factory.define :replacement do |r|
  r.name { Faker::Name.name }
  r.day_id rand(6)
  r.date Time.now
  r.association :group
  r.association :lesson
  r.association :schedule
  r.association :schedule_call
  r.association :teacher
  r.association :audience
end

Factory.define :schedule_call do |s|
  s.start_at Time.now
  s.association :schedule
end

Factory.define :schedule do |s|
  s.title { Faker::Name.name }
  s.lesson_duration rand(120)
  s.published false
end
