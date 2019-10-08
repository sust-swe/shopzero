class AuthorizeApiRequest

  def initialize(headers = {})
    @headers = headers
  end

  def call
    { user: user }
  end

  private
    attr_reader :headers

    def user
      # @user ||= User.where(id: decoded_auth_token[:user_id]).select(user_attribs) if decoded_auth_token
      @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token

    rescue ActiveRecord::RecordNotFound => record_not_found_error

      raise(ExceptionHandler::InvalidToken,
      ("#{Message.invalid_token} #{record_not_found_error.message}"))
    end

    def decoded_auth_token
      @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    end

    def http_auth_header
      if headers['Authorization'].present?
        return headers['Authorization'].split(' ').last
      end
        raise(ExceptionHandler::MissingToken, Message.missing_token)
    end

    def user_attribs
      [:id,:username,:firstname,:lastname,:email]
    end
end
