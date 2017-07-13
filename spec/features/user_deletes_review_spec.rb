require "rails_helper"

# As an authenticated user
# I want to delete my review of the gym
# So that others don't see it

# I should be able to delete a review


feature 'user deletes review' do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:gym) { FactoryGirl.create(:gym) }
  review = "This gym is great! I really enjoy working out here, its friendly and they have everything you need."

  scenario 'user successfully deletes a review' do
    visit root_path
    click_link "Sign In"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Sign In"

    click_link gym.name
    click_link 'Review this gym'

    fill_in 'Review', with: review
    click_button 'Submit Review'

    click_button 'Delete Review'

    expect(page).to_not have_content(review)
  end
end
