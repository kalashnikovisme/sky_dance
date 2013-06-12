FactoryGirl.define do
  factory :genre do
    title       { generate :string }
    description { generate :string }
    #photo       { generate :file }
  end
end
