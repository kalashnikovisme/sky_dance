# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :genre do
    title { generate :string }
    description { generate :string }
    #photo ""
    video_link { generate :site }
  end
end
