require 'rails_helper'

# As an unauthenticated user
# I want to sign in
# So that I can post items and review them

# If I am not currently signed in, I should be able to click a link that brings me to a login page
# I should be able to fill out the form with my email and password, click submit, and it should sign me in
# I should be redirected to the home page and see the sign in was Successful
# I should see a link for signing out

feature 'user signs in' do
  scenario 'user succesfully signs in with valid email and password' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: user.password_confirmation
    click_button 'Sign In'

    expect(page).to have_content("Welcome Back!")
    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")
  end

  scenario 'existing email with wrong password is denied access'

  scenario 'non-existant user tries to sign in with email and password that doesnt exist'

  scenario 'an already authenticated user cannot sign in'
end
