FactoryGirl.define do
  factory :lesson do
    time  Time.now
    day   { Lesson.day.values.first }
    group
  end
end
