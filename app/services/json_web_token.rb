class JSONWebToken
  ALGORITHM = 'RS256'

  def self.decode(token)
    payload, _ = JWT.decode(token, public_key, true, algorithm: ALGORITHM)

    return payload.with_indifferent_access
  end

  def self.encode(payload)
    exp = Time.now.to_i + 4 * 3600
    payload = payload.merge(exp: exp)
    JWT.encode(payload, private_key, ALGORITHM)
  end

  def self.public_key
    @public_key ||= OpenSSL::PKey::RSA.new(Rails.application.secrets.jwt_public_key)
  end

  def self.private_key
    @private_key ||= OpenSSL::PKey::RSA.new(Rails.application.secrets.jwt_private_key)
  end

end