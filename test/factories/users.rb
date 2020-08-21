FactoryBot.define do
  factory :user do
    sequence(:name) {|n| "arsenal1#{n}"}
    sequence(:email) {|n| "arsenal#{n}@infai.org"}
    password {"password"}
  end
end
