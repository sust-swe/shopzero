class JsonWebToken

	HMAC_SECRET = Rails.application.secrets.secret_key_base


  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload,HMAC_SECRET)
  end
	
  def self.decode(token)
    
    body = JWT.decode(token,HMAC_SECRET).first
    HashWithIndifferentAccess.new body

  rescue JWT::DecodeError => decode_error
    raise ExceptionHandler::InvalidToken, decode_error.message
  end

end