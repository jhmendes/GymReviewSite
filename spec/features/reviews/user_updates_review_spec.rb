require "rails_helper"

# As an authenticated user
# I want to update my review for the gym
# So the information is up to date


# After I'm signed in, I should be able to click on the gym and then the gyms reviews
# I should see all reviews for the gym
# I should be able to update my specific review by clicking on a link to edit it
# I should be taken to a form with the review content pre-filled in it
# I should be able to re-fill in the form, submit, and see my updated review on a new page


feature 'user updates a review' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:gym) { FactoryGirl.create(:gym) }
  review = "This gym is great! I really enjoy working out here, its friendly and they have everything you need."
  new_review = "This is the worst gym I've ever joined!  The trainers are idiots and the staff is rude.  Do not join!"

  scenario 'user successfully updates their review' do
    visit root_path

    click_link "Sign In"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Sign In"

    click_link gym.name
    click_link 'Review this gym'

    fill_in 'Review', with: review
    click_button 'Submit Review'

    click_link 'Edit Review'

    fill_in 'Review', with: new_review
    click_button 'Update Review'

    expect(page).to have_content("Reviews for #{gym.name}:")
    expect(page).to have_content(new_review)
    expect(page).to have_content("Your review was updated successfully")
  end

  scenario 'user does not provide sufficient info to update the review' do
    visit root_path
    click_link "Sign In"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Sign In"

    click_link gym.name
    click_link 'Review this gym'

    fill_in 'Review', with: review
    click_button 'Submit Review'

    click_link 'Edit Review'

    fill_in 'Review', with: ""
    click_button 'Update Review'

    expect(page).to have_content('Failed to update review')

  end
end
