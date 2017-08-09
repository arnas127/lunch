FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@test.com" }
    password 'testpass'
    type 'Employee'

    trait :admin do
      type 'Admin'
    end
  end
end
