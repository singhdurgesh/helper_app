class CashfreeEncryptionService
  def self.call(...)
    new(...).call
  end

  attr_reader :client_id, :public_key

  def initialize(client_id:, public_key:)
    @client_id = client_id
    @public_key = public_key.gsub("\\n", "\n")
  end

  def call
    public_key_object = OpenSSL::PKey::RSA.new(public_key)
    Base64.strict_encode64(public_key_object.public_encrypt("#{client_id}.#{Time.now.to_i}", OpenSSL::PKey::RSA::PKCS1_OAEP_PADDING))
  end
end
