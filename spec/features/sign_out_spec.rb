require 'rails_helper'

# As an authenticated user
# I want to sign out
# So that no one else can post items or reviews on my behalf


# I should be able to click a link that signs me out of the current session if I am currently signed in
# I should not see the link unless I am signed in


feature "user signs out" do
  scenario "user succesfully signs out of the current session" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: user.password_confirmation
    click_button 'Sign In'
    click_link 'Sign Out'

    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content("Sign In")
    expect(page).to have_content("Sign Up")
  end



end
