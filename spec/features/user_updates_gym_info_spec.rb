require 'rails_helper'
# As an authenticated user
# I want to update an item's information
# So that I can correct errors or provide new information


# A user signs into the app
# A user then clicks on a gym link
# He/she should see a link to update to the gym
# Clicking on the link takes you to an update page with a form pre-filled with the gyms info
# The user can then re-fill the form out with new info and click an update button
# The information for the gym should be updated in the database


feature 'user updates a gym' do
  scenario 'user successfully updates a gym' do

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

    click_link 'Update This Gym'

    fill_in 'Name', with: "New Gym Name"
    fill_in 'Location', with: "Somewhere else"
    fill_in 'Description', with: "This is a different gym!"
    select '$$', from: "Price Range"

    click_button 'Update'

    expect(page).to have_content("New Gym Name")
    expect(page).to have_content("Somewhere else")
    expect(page).to have_content("This is a different gym!")
    expect(page).to have_content("$$")
    expect(page).to have_content("Gym successfully updated!")


  end
  scenario 'user does not provide sufficient information for updating a gym' do
    user = FactoryGirl.create(:user)
    gym = FactoryGirl.create(:gym)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    click_link 'Add a New Gym'

    fill_in 'Name', with: gym.name
    fill_in 'Location', with: gym.location
    fill_in 'Description', with: gym.description
    select '$$$', from: "Price Range"

    click_button 'Submit'

    click_link 'Update This Gym'

    fill_in 'Name', with: ""
    fill_in 'Location', with: ""
    fill_in 'Description', with: ""
    select '', from: "Price Range"
    click_button 'Update'

    expect(page).to have_content("can't be blank")
  end
end
