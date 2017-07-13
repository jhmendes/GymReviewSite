class GymsController < ApplicationController

before_action :authenticate_user!, except: [:index, :show]


  def index
    @gyms = Gym.all
  end

  def show
    @gym = Gym.find(params[:id])
  end

  def new
    @gym = Gym.new
  end

  def create
    @gym = Gym.new(gym_params)

    if @gym.save
      redirect_to @gym, notice: "Gym added successfully!"
    else
      flash[:notice] = "Failed to save gym."
      render :new
    end
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  def destroy
    @gym = Gym.find(params[:id])

    @gym.delete
    redirect_to gyms_path
    flash[:notice] = "Gym successfully deleted!"
  end

  def update
    @gym = Gym.find(params[:id])
    @gym.update_attributes(gym_params)

    if @gym.save
      redirect_to @gym, notice: "Gym successfully updated!"
    else
      render :edit
    end

  end



  private

  def gym_params
    params.require(:gym).permit(:name, :location, :description, :price_range)
  end
end
