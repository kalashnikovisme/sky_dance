FactoryGirl.define do
  factory :lesson do
    time  Time.now
    #FIXME
    #day   { generate :enumerize }
    group
  end
end
