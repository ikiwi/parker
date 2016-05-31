class SpotsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

	def index
		render json: {spots: Spot.all, total: Spot.count}, except: [:created_at, :updated_at]
	end

	def create
		spot = Spot.new(spot_params)
		spot.save!
		render json: {spot: spot, total: Spot.count}, except: [:created_at, :updated_at]
	end

	def destroy
		spot = Spot.where(user_id: params[:user_id]).destroy_all
		render json: spot, except: [:created_at, :updated_at]
	end

	private
	def spot_params
		params.required(:spot).permit(:user_id, :latitude, :longitude)
	end

end
