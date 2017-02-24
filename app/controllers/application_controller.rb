class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  include UserConcern
  helper_method :current_user, :user_signed_in?

  def root
  end

end
