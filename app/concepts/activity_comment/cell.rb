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

  def card_image
    return if photo.blank?

    content_tag(:div, class: 'card-image') do
      content_tag(:figure, class: 'image is-square') do
        image_tag(photo.url(:thumbnail))
      end
    end
  end

  def card_content
    return if detail.blank? && game.blank?

    content_tag(:div, class: 'card-content') do
      content_tag(:div, class: 'content') do
        show_detail + game_link
      end
    end
  end

  def show_detail
    return ' ' if detail.blank?

    content_tag(:p, detail)
  end

  def game_link
    return ' ' if game.blank?

    link_to game.title_ja, game
  end
end
