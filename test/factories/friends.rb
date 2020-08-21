FactoryBot.define do
  factory :friend do
    user nil
    receiver {1}
    action {"MyString"}
    status {"MyString"}
  end
end
