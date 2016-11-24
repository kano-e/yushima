class SessionsController < ApplicationController
  def new
    @auth_token_key = 'token%04d' % rand(10000)
    session[:auth_token_key] = @auth_token_key
    session[:back_to] = params[:current_page]
  end

  def create
    authenticate!

    back_to = session.delete(:back_to).presence
    redirect_to back_to || :root
  end

  def destroy
    warden.logout
    redirect_to :root
  end
end
