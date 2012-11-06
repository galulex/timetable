FactoryGirl.define do
  factory :audience do
    title { rand(120) }
    association :schedule
  end
end

FactoryGirl.define  do
  factory :institution do
    name  Faker::Name.first_name
    association :dispatcher
  end
end

FactoryGirl.define  do
  factory :teacher do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    hours { rand(100) }
    association :schedule
  end
end

FactoryGirl.define  do
  factory :group do
    name Faker::Name.name
    association :teacher
    association :schedule
  end
end

FactoryGirl.define do
  factory :lesson do

    name  Faker::Name.name
    day_id  { rand(6) }
    association :group
    association :schedule
    association :schedule_call
    association :teacher
    association :audience
  end
end

FactoryGirl.define do
  factory:replacement do

    name  Faker::Name.name
    day_id { rand(6) }
    date Time.now
    association :group
    association :lesson
    association :schedule
    association :schedule_call
    association :teacher
    association :audience
  end
end

FactoryGirl.define do
  factory  :schedule_call do
    start_at Time.now
    association :schedule
  end
end

FactoryGirl.define do
  factory :schedule do
    title  Faker::Name.name
    published false
  end
end
