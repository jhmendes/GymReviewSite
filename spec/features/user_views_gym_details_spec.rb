require 'rails_helper'

# As an authenticated user
# I want to view the details about an item
# So that I can get more information about it

# I should be able to click on any gym and view the details for that gym
# I should see the name, location, description, and any future attributes

feature "user views details of a gym" do

  scenario "user successfully views a gym's details" do

    gym = Gym.create(name: "Big Sky Fitness", location: "Newington, CT", description: "20,000 square foot fitness center with free weights, cardio, classes, training, etc.")

    visit root_path
    click_link "Big Sky Fitness"

    expect(page).to have_current_path(gym_path(gym))
    expect(page).to have_content("Gym Details:")
    expect(page).to have_content(gym.name)
    expect(page).to have_content(gym.location)
    expect(page).to have_content(gym.description)

  end

end
