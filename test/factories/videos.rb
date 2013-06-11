FactoryGirl.define do
  factory :video do
    link { generate :url }
  end
end
