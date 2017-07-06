FactoryGirl.define do
  factory :message do
    text        {Faker::Pokemon.name}
    image       {File.open("#{Rails.root}/spec/images/1.jpg")}
    user
    group
    created_at  { Faker::Time.between(2.days.ago, Time.now, :all) }
    updated_at  { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
