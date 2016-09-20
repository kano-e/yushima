class Activity::Cell < Cell::ViewModel
  include ::Cell::Slim

  property :day

  def index
    render :index
  end

  def show_link
    link_to 'Show', model
  end
end
