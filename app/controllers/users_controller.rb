class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end
  
  def create
  	@user = User.new(user_params)
  	if @user.save
  		#render a view
  	else
  		render 'new'
  	end
  end

  private

  	def user_params
  	  params.require(:user).permit(:firstname,:lastname,:username,:password,:password_confirmation,:email);
  	end

end
