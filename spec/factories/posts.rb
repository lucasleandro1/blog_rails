FactoryBot.define do
  factory :post do
    text { "MyString" }
    tag { "MyString" }
    user { nil }
  end
end
