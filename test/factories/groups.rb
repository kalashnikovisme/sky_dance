FactoryGirl.define do
  factory :group do
    category    { generate :string }
    once_price  { generate :integer }
    price       { generate :integer }
    teacher
    genre
  end
end
