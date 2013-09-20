FactoryGirl.define do
  factory :unlimit do
    price { generate :integer }
    name  { generate :string }
  end
end
