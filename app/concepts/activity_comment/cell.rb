class ActivityComment::Cell < Cell::ViewModel
  include ::Cell::Slim

  property :photo
  property :detail
  property :game

  def index
    render :index
  end

  def show_photo
    return img_tag(photo) if photo.present?
    'No Photo'
  end

  def show_detail
    return detail if detail.present?
    'No Detail'
  end

  def game_link
    link_to game.title_ja, game
  end
end
