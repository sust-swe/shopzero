class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:name,:password,:password_confirmation)
    end
end
