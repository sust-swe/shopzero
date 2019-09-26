class AdminController < ApplicationController
	
	skip_before_action :verify_authenticity_token
	
	def new
		render json: { "name": "voldemort" }
	end
	
	def create
		render json: admin_params
	end

	private

	def admin_params
		params.require(:admin).permit(:name)
	end

end
