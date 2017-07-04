class GymsController < ApplicationController

# before_action :authenticate_user!, except: [:index, :show]
# unauthenticated users may only VIEW the gyms index and invidual show pages
# they cannot create, edit, or delete gyms
# this should be the same for reviews

  def index

  end
end
