
require 'rails_helper'

# As an authenticated user
# I want to delete an item
# So that no one can review it


# I must be signed in to delete a gym
# On the gyms show page, I should see a link to delete the gym
# If I click the link, I should see a warning message before deleting
# Clicking the link destroys the Active Record object for the gym


feature 'user deletes a gym' do
  scenario 'user successfully deletes a gym' do
    user = FactoryGirl.create(:user)
    gym = FactoryGirl.create(:gym)

    visit root_path
    click_link "Sign In"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    click_link 'Add a New Gym'

    fill_in 'Name', with: gym.name
    fill_in 'Location', with: gym.location
    fill_in 'Description', with: gym.description
    select '$$$', from: "Price Range"

    click_button 'Submit'

    click_button 'Delete This Gym'

    expect(page).to have_content("Gym successfully deleted!")
    expect(page).to have_current_path(gyms_path)
  end
end
