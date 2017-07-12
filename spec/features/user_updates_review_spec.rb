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
  scenario 'user successfully updates their review'

end
