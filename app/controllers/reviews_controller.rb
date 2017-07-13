class ReviewsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @gym = Gym.find(params[:gym_id])
    @reviews = @gym.reviews
    @user = current_user
  end

  def new
    @gym = Gym.find(params[:gym_id])
    @review = Review.new
  end

  def edit
    @gym = Gym.find(params[:gym_id])
    @review = Review.find(params[:id])
  end

  def update
    @gym = Gym.find(params[:id])
    @review = Review.find(params[:id])
    @review.update_attributes(review_params)

    if @review.save
      redirect_to gym_reviews_path
      flash[:notice] = "Your review was updated successfully"
    else
      flash[:notice] = "Failed to update review"
      render :edit
    end
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

  def destroy
    @review = Review.find(params[:id])
    @review.delete
    redirect_to gym_reviews_path
  end


  def review_params
    params.require(:review).permit(:content, :gym_id, :user_id)
  end
end
