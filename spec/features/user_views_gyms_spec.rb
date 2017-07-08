require 'rails_helper'

# As an authenticated user
# I want to view a list of items
# So that I can pick items to review

# I should be able to see gyms whether I am signed in or not
# On the home page

feature "user views a list of gyms" do

  scenario "user views list of gyms" do

    gym = Gym.create(name: "Big Sky Fitness", location: "Newington, CT", description: "20,000 square foot fitness center with free weights, cardio, classes, training, etc.", price_range: "$$")

    visit root_path

    expect(page).to have_content("Big Sky Fitness")

  end

end
