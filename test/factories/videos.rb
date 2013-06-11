FactoryGirl.define do
  factory :video do
    link { generate :url }
    genre
  end
end
