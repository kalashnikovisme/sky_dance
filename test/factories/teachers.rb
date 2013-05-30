FactoryGirl.define do
  factory :teacher do
    first_name		{ generate :string }
    middle_name   	{ generate :string }
    description		{ generate :string }
    motto		{ generate :string }
  end
end
