require "rails_helper"

# As an authenticated user
# I want to add an item
# So that others can review it

# I want to create a new gym to review
# I must be signed in to do so


feature "user creates a new gym to review" do
  scenario "user successfully creates new gym" do
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

     expect(page).to have_content(gym.name)
     expect(page).to have_content(gym.location)
     expect(page).to have_content(gym.description)
     expect(page).to have_content(gym.price_range)
     expect(page).to have_content("Gym added successfully!")

  end

  scenario "user does not supply enough information to create gym" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link "Sign In"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    click_link 'Add a New Gym'

    click_button 'Submit'

    expect(page).to have_content("can't be blank")
    expect(page).to have_current_path(new_gym_path)
  end

end
