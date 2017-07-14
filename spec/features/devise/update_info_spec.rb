require 'rails_helper'


# As an authenticated user
# I want to update my information
# So that I can keep my profile up to date

# if I am authenticated, I should be able to update my first name, last name, email, or password
# if I am not signed in, I should not be able to update my information, I need to first sign in


feature "user updates profile information" do
  scenario "user successfully updates information" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    # fill_in 'Password Confirmation', with: user.password_confirmation
    click_button 'Sign In'

    click_link "Update Profile"
    fill_in 'First Name', with: 'Bobby'
    fill_in 'Last Name', with: 'Jack'
    fill_in 'Email', with: 'bobbyj@gmail.com'
    fill_in 'Password', with: 'newpassword'
    fill_in 'Password Confirmation', with: 'newpassword'
    fill_in 'Current Password', with: user.password
    click_button 'Update'

    expect(page).to have_content("Profile successfully updated!")
    expect(page).to have_content('Sign Out')
    expect(page).to have_content('Update Profile')

  end

  scenario "user tries to update passwords but the update passwords don't match" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    # fill_in 'Password Confirmation', with: user.password_confirmation
    click_button 'Sign In'

    click_link "Update Profile"
    fill_in 'First Name', with: 'Bobby'
    fill_in 'Last Name', with: 'Jack'
    fill_in 'Email', with: 'bobbyj@gmail.com'
    fill_in 'Password', with: 'newpassword'
    fill_in 'Password Confirmation', with: 'otherpassword'
    fill_in 'Current Password', with: user.password

    click_button 'Update'

    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario "user tries to update email with one that is already taken by another user" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    # fill_in 'Password Confirmation', with: user.password_confirmation
    click_button 'Sign In'

    click_link "Update Profile"
    fill_in 'First Name', with: 'Bobby'
    fill_in 'Last Name', with: 'Jack'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: 'newpassword'
    fill_in 'Password Confirmation', with: 'newpassword'
    fill_in 'Current Password', with: user.password

    click_button 'Update'

    expect(page).to have_content("Email has already been taken")
  end

end
