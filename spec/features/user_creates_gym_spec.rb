require "rails_helper"

# As an authenticated user
# I want to add an item
# So that others can review it

# I want to create a new gym to review
# I must be signed in to do so
# If I am not signed in, I am re-directed to the Sign In page

feature "user creates a new gym to review" do
  scenario "user successfully creates new gym"
  scenario "user does not supply enough information to create gym"
  scenario "an unauthenticated user tries to create a gym"
end
