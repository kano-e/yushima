class PagesController < ApplicationController
  def show
    record_event_item_ids
    set_purchase_event
    render params[:id]
  end
end
