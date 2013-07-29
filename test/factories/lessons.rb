FactoryGirl.define do
  factory :lesson do
    time  Time.now
    #FIXME
    #day   "---\n- #{:monday}\n"
    #day   Lesson.day.values.first
    group
  end
end
