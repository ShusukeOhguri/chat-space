FactoryGirl.define do
  factory :group do
    id          "1"
    name        {Faker::Name.title}

    after(:create) do |group|
      group.messages << create_list(:message, 5)
    end
  end
end
