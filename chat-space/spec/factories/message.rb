FactoryGirl.define do
  factory :message do
    text      "a"
    image File.open("#{Rails.root}/spec/images/1.jpg")
    group_id  "1"
    user_id   "2"
  end
end
