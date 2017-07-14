require "rails_helper"

# As an authenticated user
# I want to add a review
# So others can decide if they like the gym

# I should be able to add a review if I am signed in
# After signing in, I can click on a link for a specific gym
# Once there, I should be able to click a link to review the gym
# It should take me to a new review page for that gym
# I should fill in the content box with my review and click submit
# I should be re-directed to the page with all of the reviews for the gym

feature 'user adds a review for a gym' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:gym) { FactoryGirl.create(:gym) }
  review = "This gym is great! I really enjoy working out here, its friendly and they have everything you need."

  scenario "user successfully adds a review" do

    visit root_path
    click_link "Sign In"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Sign In"


    click_link gym.name
    click_link 'Review this gym'


    fill_in 'Review', with: review
    click_button 'Submit Review'

    expect(page).to have_content("Reviews for #{gym.name}:")
    expect(page).to have_content(review)
    expect(page).to have_content("Review saved successfully.")

  end

  scenario "user does not provide content for review" do
    visit root_path
    click_link "Sign In"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    click_link gym.name
    click_link 'Review this gym'

    click_button 'Submit Review'


    expect(page).to have_content("Failed to save review.")
    expect(page).to have_content("New Review for #{gym.name}")
  end

  scenario "unauthenticated user tries to submit a review" do
    visit new_gym_review_path(gym)

    expect(page).to have_content("You need to sign in or sign up before continuing")
  end
end
