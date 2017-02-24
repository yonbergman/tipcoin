module UserConcern

  JWT_TOKEN_KEY = :userjwt

  def authorize
    redirect_to '/login' unless user_signed_in?
  end

  def current_user
    @_user ||= user_from_token(session[JWT_TOKEN_KEY]) if session[JWT_TOKEN_KEY]
  end

  def user_signed_in?
    current_user.present?
  end

  def sign_out
    session[JWT_TOKEN_KEY] = nil
    @_user = nil
  end

  def sign_in(user)
    session[JWT_TOKEN_KEY] = JSONWebToken.encode(sub: user.id,
                                          name: user.name)
    @_user = user
  end

  def user_from_token(token)
    payload = JSONWebToken.decode(token)
    User.find(payload[:sub])
  end

end