class UsersController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :authorize_request, only: [:edit,:update]
  before_action :check_user_right, only: [:edit,:update]

  def create
    @user = User.new(user_params)
    if @user.save
      auth_token = AuthenticateUser.new(@user.email,@user.password).call
      response = { message: Message.account_created, auth_token: auth_token}
      UserMailer.account_activation(@user).deliver_now
      render json: response.as_json, status: :created
    else
      head(:forbidden)
    end
  end

  def edit
    render json: @current_user
  end

  def update
    if @current_user.update_attributes!(user_params)
      render json: @current_user, status: :accepted
    else
      head(:forbidden)
    end
  end

  private

  	def user_params
  	  params.require(:user).permit(:firstname,:lastname,:username,:password,:password_confirmation,:email);
  	end

    def check_user_right
      @user = User.find_by(username: params[:id])
      unless @user == @current_user
        return head(:unauthorized)
      end
    end

end