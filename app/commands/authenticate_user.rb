class Authenticateclient
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(client_id: client.id) if client
  end

  private

  attr_accessor :email, :password

  def client
    client = Client.find_by_email(email)
    return client if client && client.authenticate(password)

    errors.add :client_authentication, 'invalid credentials'
    nil
  end
end