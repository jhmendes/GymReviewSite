FactoryGirl.define do
  factory :user do
    email "example@gmail.com"
    first_name "Bob"
    last_name "Jackson"
    password "mypassword"
    password_confirmation "mypassword"
    role "user"
  end
end
