FactoryGirl.define do
  factory :user do
    username 'anornymous'
    password 'foothill'
    sequence(:email) { |n| "foothill#{n}@example.com" }
  end
end
