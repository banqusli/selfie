FactoryBot.define do
  factory :notification do
    user nil
    receiver_id {1}
    action {"MyString"}
    info {"MyString"}
  end
end
