class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation,params[:id])
      user.update_attribute(:activated,true)
      user.update_attribute(:activated_at, Time.zone.now)
      head(:accepted)
    else
      head(:forbidden)
    end
  end

end
