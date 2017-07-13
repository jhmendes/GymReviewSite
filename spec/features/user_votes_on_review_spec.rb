require "rails_helper"

# As an authenticated user
# I want to vote on a review
# So that the user who wrote the review sees if I agree with them or not

# I should not be able to vote on a review unless I am signed in
# I should sign into the application and then click on any gym
# I should be able to click on the gyms reviews page to see a list of reviews
# I should be able to up vote or down vote any review
# I should only be able to do this once per review


feature 'user votes on a review ' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:gym) { FactoryGirl.create(:gym) }
  
  scenario 'user successfully upvotes a review' do

    review = Review.create(user_id: user.id, gym_id: gym.id, content: "This gym is great!")
    visit root_path
    click_link "Sign In"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Sign In"


    click_link gym.name

    click_link 'Reviews for this gym'

    # fill_in 'Review', with: review
    # click_button 'Submit Review'

    click_button "Vote Up"

    expect(page).to have_content('Positive Ratings: 1')


  end
  # scenario 'user successfully downvotes a review'
end
