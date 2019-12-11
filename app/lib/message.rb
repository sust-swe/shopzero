class Message
  def self.not_found(record = "record")
    "Sorry #{record} not found"
  end

  def self.invalid_credentials
    "Invalid Credentials"
  end

  def self.invalid_token
    "Invalid token"
  end

  def self.missing_token
    "Missing token"
  end

  def self.unauthorized
    "Unauthorized request"
  end

  def self.account_created
    "Account created successfully"
  end

  def self.logged_in
    "Logged in successfully"
  end

  def self.account_not_created
    "Account could not be created"
  end

  def self.expired_token
    "Sorry, your token has expired. Please login to continue."
  end

  def self.permission_denied(operation = "Operation")
    "Sorry, operation not permitted!"
  end

  def self.successful(operation = "Operation")
    "#{operation} Successful!"
  end

  def self.unsuccessful(operation = "Operation")
    "#{operation} was Unsuccessful!"
  end
end
