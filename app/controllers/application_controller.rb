class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ApplicationHelper

  private

  def params!(params)
    params.merge(current_user: current_user)
  end

  # @deprecated
  def record_event_item_ids(*ids)
    session.delete(:event_item_ids)
  end

  def set_purchase_event
    ids = session[:add_to_cart_ids]

    if ids.present?
      @event_type = 'Purchase'
      @content_ids = ids
      session.delete(:add_to_cart_ids)
    else
      set_content_ids
    end
  end

  def set_content_ids(*ids)
    view_content_ids = session[:view_content_ids]

    if view_content_ids.present?
      @event_type = 'AddToCart'
      @content_ids = view_content_ids
      session[:add_to_cart_ids] = @content_ids
      session.delete(:view_content_ids)
    elsif ids.present?
      @event_type = 'ViewContent'
      @content_ids = ids.first(10)
      session[:view_content_ids] = @content_ids
    end
  end
end
