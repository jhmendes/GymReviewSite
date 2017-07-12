require "rails_helper"

# As an authenticated user
# I want to view a list of reviews about the gym
# So I can determine what gym I would like to join


# I should be able to click on any gym and be taken to its show page
# Once there I should see a list of reviews for the particular gym


feature "user views reviews for a gym" do
  scenario "user successfully views reviews on a gym" do
    user = FactoryGirl.create(:user)
    gym = Gym.create(name: "Big Sky Fitness", location: "Newington, CT", description: "20,000 square foot fitness center with free weights, cardio, classes, training, etc.", price_range: "$$")
    review = Review.create(user_id: user.id, gym_id: gym.id, content: "This gym is great! I really enjoy working out here.")

    visit root_path
    click_link 'Big Sky Fitness'
    click_link 'Reviews for this gym'

    expect(page).to have_content("Reviews for Big Sky Fitness:")
    expect(page).to have_content(review.content)


  end
end
