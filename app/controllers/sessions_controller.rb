class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params.require(:email)).authenticate(params.require(:password))
    if user
      sign_in(user)
      head :created
    else
      head :not_found
    end
  end

  def destroy
    sign_out
    redirect_to :root
  end
end