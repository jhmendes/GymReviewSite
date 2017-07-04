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

  scenario 'existing email with wrong password is denied access' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: "wrongpassword"
    fill_in "Password Confirmation", with: "wrongpassword"
    click_button "Sign In"

    expect(page).to_not have_content("Sign Out")

  end

  scenario 'non-existant user tries to sign in with email and password that doesnt exist' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: "Nobody@gmail.com"
    fill_in 'Password', with: "nopassword"
    fill_in 'Password Confirmation', with: "nopassword"
    click_button 'Sign In'

    expect(page).to_not have_content("Welcome Back!")
    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content("Invalid Email or password.")

  end

  scenario 'an already authenticated user cannot re-sign in' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: user.password_confirmation
    click_button "Sign In"
    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")

    visit new_user_session_path
    expect(page).to have_content("You are already signed in.")
  
  end
end
