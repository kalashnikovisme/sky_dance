FactoryGirl.define do
  factory :photo do
    photo { generate :file }
    teacher_id { Teacher.last ? Teacher.last.id : create(:teacher).id }
  end
end
