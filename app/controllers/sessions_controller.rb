class SessionsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
    render json: current_user
  end

  def create
    @user = User.find_by(email: params[:email])
    return if @user.nil?
    if @user.authenticated?(:password,params[:password]) && @user.activated
      log_in @user
      render json: @user
    else
      render json: { success: 0 }
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
        @current_user ||= User.find(session[:user_id])
      end
    end

    def logged_in?
      !current_user.nil?
    end

    def log_out
      session.delete(:user_id)
    end
end
