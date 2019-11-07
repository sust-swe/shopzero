class SessionsController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :authorize_request, only: [:new,:destroy]

  def new
    if logged_in?
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
      response = { message: Message.logged_in, auth_token: auth_token, user: @user.as_json(only: [:id,:firstname,:lastname,:email])}
      render json: response.as_json, status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy
    log_out
    head(:accepted)
  end

  private

    def log_in(user)
      session[:user_id] = user.id
    end

    def logged_in?
      !session[:user_id].nil?
    end

    def log_out
      session.delete(:user_id)
    end
end
