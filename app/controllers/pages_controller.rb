class PagesController < ApplicationController
  def show
    @event_item_ids = session[:event_item_ids] || []
    render params[:id]
  end
end
