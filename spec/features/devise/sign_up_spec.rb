require 'rails_helper'

# As a prospective user
# I want to create an account
# So that I can post items and review them

# I currently do not have account
# On the index/home page, I should be able to click a button that brings me to a sign up page with a form on it
# if I supply complete information, I should be signed up and re-directed to the home/index page
# I must supply a valid email, first and last name, password that matches
# I should see a welcome type message saying "Sign Up Successful" or something similar
# If I do not supply complete information, I should remain on the page and see the appropriate errors
# If I try to sign up again after already becoming a user, I should see error messages and not be able to sign up a 2nd time

feature "user signs up" do


  scenario "specify valid and required information" do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: "John"
    fill_in 'Last Name', with: "Mendes"
    fill_in 'Email', with: "johniscool@gmail.com"
    fill_in 'Password', with: "mypassword"
    fill_in 'Password Confirmation', with: "mypassword"

    click_button "Sign Up"

    expect(page).to have_content("Sign Up Successful!")
    expect(page).to have_content("Sign Out")
  end

  scenario "required information not specified" do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign Out")
  end

  scenario "Passwords don't match" do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Password', with: "mypassword"
    fill_in 'Password Confirmation', with: "anotherpassword"

    click_button "Sign Up"
    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Sign Out")
  end

end
