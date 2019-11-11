module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      # puts cookies[:token]
      # puts request.params.to_a
      # self.current_user = authorize_request
      @current_user ||= authorize_request
    end

    private

    def authorize_request
      @current_user = user
    end

    def user
      @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    rescue ActiveRecord::RecordNotFound => record_not_found_error
      raise(ExceptionHandler::InvalidToken,
            ("#{Message.invalid_token} #{record_not_found_error.message}"))
    end

    def decoded_auth_token
      @decoded_auth_token ||= JsonWebToken.decode(cookies[:token])
    end
  end
end
