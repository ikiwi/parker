class TargetsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

	def index
		render json: {targets: Target.all, total: Target.count}, except: [:created_at, :updated_at]
	end

	def create
		target = Target.new(target_params)
		target.save!
		render json: {target: target, total: Target.count}, except: [:created_at, :updated_at]
	end

	def destroy
		Target.find_by_id(params[:id]).destroy
		redirect_to root_path
	end

	private
	def target_params
		params.required(:target).permit(:user_id, :latitude, :longitude)
	end

end
