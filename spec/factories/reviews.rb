FactoryGirl.define do
  factory :review do
    content "This is my review for this gym, its great"

    association :gym, factory: :gym
    association :user, factory: :user
  end
end
