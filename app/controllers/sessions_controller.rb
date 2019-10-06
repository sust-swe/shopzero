class SessionsController < ApplicationController

  skip_before_action :verify_authenticity_token
  skip_before_action :authorize_request, only: :create

  def new
    if current_user
      render json: current_user.as_json, status: :ok
    else
      head(:not_found)
    end
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.nil?
      return head(:not_found)
    elsif @user.authenticated?(:password,params[:password]) && @user.activated
      log_in @user
      auth_token = AuthenticateUser.new(params[:email],params[:password]).call
      response = { message: Message.account_created, auth_token: auth_token}
      render json: response.as_json, status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy
    log_out
    render json: { success: 1 }
  end

  private

    def log_in(user)
      session[:user_id] = user.id
    end

    def current_user
      if session[:user_id]
        # @current_user ||= User.find(session[:user_id])
        @current_user ||= User.where(id:session[:user_id]).select(:id,:firstname,:lastname,:email,:username)

      end
    end

    def logged_in?
      !current_user.nil?
    end

    def log_out
      session.delete(:user_id)
    end
end
