class SessionsController < ApplicationController
  def new
    @auth_token_key = 'token%04d' % rand(10000)
    session[:auth_token_key] = @auth_token_key
  end

  def create
    authenticate!
    redirect_to :root
  end

  def destroy
    warden.logout
    redirect_to :root
  end
end
