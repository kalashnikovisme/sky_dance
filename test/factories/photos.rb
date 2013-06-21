FactoryGirl.define do
  factory :photo do
    photo { generate :file }
    teacher
  end
end
