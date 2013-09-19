FactoryGirl.define do
  factory :unlimit do
    price { generate :integer }
  end
end
