module API
  class BaseController < ApplicationController

    before_action :authorize

    def authorize
      head :unauthorized unless user_signed_in?
    end

  end
end