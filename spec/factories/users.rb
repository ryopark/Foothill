FactoryGirl.define do
  factory :user do
    name 'anornymous'
    password 'foothill'
    sequence(:email) { |n| "foothill#{n}@example.com" }
  end
end
