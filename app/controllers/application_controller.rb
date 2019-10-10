class ApplicationController < ActionController::Base
  include ExceptionHandler

  attr_reader :current_user

  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
  
end
