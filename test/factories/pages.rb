FactoryGirl.define do
  factory :page do
    title { generate :string }
    text { generate :string }
    slug { generate :string }
  end
end
