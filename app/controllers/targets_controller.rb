class TargetsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

	def index
		render json: {targets: Target.all, total: Target.count}, except: [:created_at, :updated_at]
	end

	def create
		target = Target.where(user_id: params[:user_id]).first_or_create
		target.latitude = params[:latitude]
		target.longitude = params[:longitude]
		target.save!
		render json: {target: target, total: Target.count}, except: [:created_at, :updated_at]
	end

	def destroy
		Target.find_by_id(params[:id]).destroy
		redirect_to root_path
	end
end
