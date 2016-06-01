class SpotsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

	def index
		spots = Spot.where(target_id: nil)
		if current_user
			id = 1 #TODO#
		end
		targets = Spot.where(target_id: id)
		render json: {spots: spots, targets: targets, total: spots.count + targets.count}, except: [:created_at, :updated_at]
	end

	def create
		spot = Spot.new(spot_params)
		spot.save!
		render json: {spot: spot, total: Spot.count}, except: [:created_at, :updated_at]
	end

	def update
		spot = Spot.find_by_id(params[:id])
		spot.target_id = (params[:target_id] ? params[:target_id] : nil)
		spot.save!
		render json: spot, except: [:created_at, :updated_at]
	end

	def destroy
		spot = Spot.find_by(latitude: params[:lat], longitude: params[:lng]).destroy
		render json: spot, except: [:created_at, :updated_at]
	end

	private
	def spot_params
		params.required(:spot).permit(:user_id, :latitude, :longitude)
	end

end
