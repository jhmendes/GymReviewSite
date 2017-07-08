FactoryGirl.define do
  factory :gym do
    sequence(:name) { |n| "exampleGym#{n}"}
    location "Somewhere, CT"
    description "This is an example gym, its cool and has weights that make you hyooooge!"
    price_range "$$$"
  end
end
