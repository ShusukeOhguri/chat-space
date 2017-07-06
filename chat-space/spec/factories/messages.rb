FactoryGirl.define do
  factory :message do
    text        {Faker::Pokemon.name}
    image       {File.open("#{Rails.root}/spec/images/1.jpg")}
    user_id     "1"
    group_id    "1"
    created_at  { Faker::Time.between(2.days.ago, Time.now, :all) }
    updated_at  { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
