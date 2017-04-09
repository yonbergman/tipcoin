module API
  module V1
    class SessionsController < BaseController

      skip_before_action :authorize, only: [:create]

      def create
        user = User.find_by(email: params.require(:email)).authenticate(params.require(:password))
        if user
          token = JSONWebToken.encode(sub: user.id, name: user.name)
          render json: {token: token}
        else
          head :not_found
        end
      end

    end
  end
end