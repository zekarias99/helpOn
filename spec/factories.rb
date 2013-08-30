FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:last_name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :friendship do
    association :user, factory: :user
    association :friend, factory: :user

    factory :pending_user_friendship do
      state 'pending'
    end

    factory :requested_user_friendship do
      state 'requested'
    end

    factory :accepted_user_friendship do
      state 'accepted'
    end
  end

  factory :status do
    content "Lorem ipsum"
    user
  end
end