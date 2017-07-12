class ReviewsController < ApplicationController
  def index
    @gym = Gym.find(params[:gym_id])
    @reviews = @gym.reviews
  end
end
