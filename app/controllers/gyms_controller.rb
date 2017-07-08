class GymsController < ApplicationController

# before_action :authenticate_user!, except: [:index, :show]
# unauthenticated users may only VIEW the gyms index and invidual show pages
# they cannot create, edit, or delete gyms
# this should be the same for reviews

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
      redirect_to new_gym_path
    end
  end

  def edit
    @gym = Gym.find(params[:id])
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
