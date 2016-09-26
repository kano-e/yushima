class ActivityComment::Cell < Cell::ViewModel
  include ::Cell::Slim

  property :photo
  property :detail
  property :game

  def index
    render :index
  end

  def show_photo
    return image_tag(photo.url) if photo.present?
    'No Photo'
  end

  def show_thumb
    return image_tag(photo.url(:thumbnail)) if photo.present?
    'No Photo'
  end

  def show_detail
    return detail if detail.present?
    'No Detail'
  end

  def game_link
    return link_to game.title_ja, game if game.present?
  end
end
