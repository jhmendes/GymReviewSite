class GymsController < ApplicationController

before_action :authenticate_user!, except: [:index, :show]


  def index
    @gyms = Gym.all
    # @user = current_user

    if params[:search]
      @gyms = Gym.search(params[:search]).order("name DESC")
      else
      @gyms= Gym.all.order('name DESC')
    end
  end

  def show
    @gym = Gym.find(params[:id])
    # @user = current_user
  end

  def new
    @gym = Gym.new
    @user = current_user
  end

  def create
    @gym = Gym.new(gym_params)
    #  @user = current_user
    if @gym.save
      redirect_to @gym, notice: "Gym added successfully!"
    else
      flash[:notice] = "Failed to save gym."
      render :new
    end
  end

  def edit
    @gym = Gym.find(params[:id])
    # @user = current_user
  end

  def destroy
    @gym = Gym.find(params[:id])
@user = current_user
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
