module API
  module V1
    class UserController < BaseController
      def show
        render json: current_user
      end
    end
  end
end