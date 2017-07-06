FactoryGirl.define do
  factory :user do
    id                    "1"
    name                  {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              "88888888"
    password_confirmation "88888888"

    after(:create) do |user|
      user.groups << create(:group)
    end
  end
end
