class UsersController < ApplicationController

  skip_before_action :verify_authenticity_token
  skip_before_action :authorize_request, only: :create

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auth_token = AuthenticateUser.new(@user.email,@user.password).call
      response = { message: Message.account_created, auth_token: auth_token}
      UserMailer.account_activation(@user).deliver_now
      # json_response(response, :created)
      render json: response.as_json, status: :created
    else
      head(:forbidden)
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
  	  params.require(:user).permit(:firstname,:lastname,:username,:password,:password_confirmation,:email);
  	end

end