# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lesson do
    group "MyString"
    day_of_week "2013-05-31"
    time "2013-05-31 00:39:41"
    price 1
    teacher_id 1
  end
end
