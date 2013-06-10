include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :photo do
    photo { fixture_file_upload('logo.png', 'image/png') }
  end
end
