class UsersController < ApplicationController
	def index
		users = User.all
		render json: users, except: [:created_at, :updated_at]
	end

	def show
		spots = Spot.where(user_id: params[:id])
		targets = Target.where(user_id: params[:id])

		render json: {spots: spots, targets: target}, except: [:created_at, :updated_at]
	end

end
