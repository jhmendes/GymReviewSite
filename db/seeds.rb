# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gyms = [
  ["Anytime Fitness", "Farmington, CT", "24 hour fitness center with free weights and cardio equipment", "$$"],
  ["Big Sky Fitness", "Newington, CT", "20,000 square foot fitness center with free weights, cardio, classes, training, etc.", "$"],
  ["Hold Fast Personal Training", "Farmington, CT", "Semi-Private personal training studio ran by the worlds best personal trainer", "$$$"]
]


gyms.each do |gym_info|
  name, location, description, price_range = gym_info
  Gym.create!(name: name, location: location, description: description, price_range: price_range)
end
