FactoryGirl.define do
  factory :photo do
    photo { generate :file }
  end
end
