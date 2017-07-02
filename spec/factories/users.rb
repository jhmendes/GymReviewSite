FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@gmail.com"}
    first_name "Bob"
    last_name "Jackson"
    password "mypassword"
    password_confirmation "mypassword"
    role "user"
  end
end
