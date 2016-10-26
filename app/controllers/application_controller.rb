class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ApplicationHelper

  private

  def record_event_item_ids(*ids)
    event_item_ids = session[:event_item_ids] || []
    event_item_ids = ids + event_item_ids
    session[:event_item_ids] = event_item_ids.uniq.first(10)
  end
end
