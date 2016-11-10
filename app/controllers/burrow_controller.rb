class BurrowController < ApplicationController

  include BurrowHelper

  def index
      
      @locations = Location.all

      @location = Location.new(location_params)

      @location.user_id = current_user.id

      @location.save

      current_user.location_id = @location.id

      current_user.save

      distances = []

  end

  def members
    @locations = Location.all
    @users = User.all
  end

  def places
    @locations = Location.all
  end

  def time
    @users = User.all
  end

  private

  def location_params
  	params.permit(:latitude, :longitude, :user_id)
  end
  
end
