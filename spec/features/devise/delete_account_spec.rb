require 'rails_helper'

# As an authenticated user
# I want to delete my account
# So that my information is no longer retained by the app

# If I am signed in, I should be able to delete my account
# I should be able to delete my account from the update profile page

feature 'user deletes account' do

  scenario 'user successfully deletes account' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    # fill_in 'Password Confirmation', with: user.password_confirmation
    click_button 'Sign In'

    click_link "Update Profile"

    click_button "Cancel my account"

    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
  end

end
