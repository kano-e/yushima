class SessionsController < ApplicationController
  def new
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
