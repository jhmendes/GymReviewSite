class ReviewsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @gym = Gym.find(params[:gym_id])
    @reviews = @gym.reviews
  end

  def new
    @gym = Gym.find(params[:gym_id])
    @review = Review.new
  end

  def create
    @gym = Gym.find(params[:gym_id])
    @review = Review.new(review_params)
    @review.gym = @gym
    @user = current_user
    @review.user = @user

    if @review.save
      flash[:notice] = "Review saved successfully."
      redirect_to gym_reviews_path(@gym)
    else
      flash[:alert] = "Failed to save review."
      render :new
    end
  end


  def review_params
    params.require(:review).permit(:content)
  end
end
