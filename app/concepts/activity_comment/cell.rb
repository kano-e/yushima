class ActivityComment::Cell < Cell::ViewModel
  include ::Cell::Slim
  include ApplicationHelper

  property :photo
  property :detail
  property :game
  property :activity

  def index
    render :index
  end

  def meta
    render :meta
  end

  def title_tag
    content_tag(:title, detail)
  end

  def og_title_tag
    meta_tag(:title, detail)
  end

  def og_url_tag
    og_tag(:url, activity_activity_comment_url(model, activity_id: activity.id))
  end

  def og_description_tag
    text = "#{activity.day}の活動"
    if game
      text += " #{game.title_ja}"
    end
    og_tag(:description, text)
  end

  def og_image_tag
    return og_tag(:image, photo.url(:ll)) if photo.present?

    if game && game.photo.present?
      return og_tag(:image, game.photo.url(:ll))
    end

    default_og_image_tag
  end

  def show_image
    return if photo.blank?

    content_tag(:div, class: 'card-image') do
      image_tag(photo.url(:l))
    end
  end

  def card_image
    return if photo.blank?

    content_tag(:div, class: 'card-image') do
      show_link(image_tag(photo.url(:sm)))
    end
  end

  def card_content
    return if detail.blank?

    content_tag(:div, class: 'card-content') do
      content_tag(:div, class: 'content') do
        truncate_detail
      end
    end
  end

  def card_action
    content_tag(:div, class: 'card-action right-align') do
      show_link
    end
  end

  def truncate_detail
    return if detail.blank?
    content_tag(:p, detail, class: 'truncate')
  end

  def game_link
    return if game.blank?
    link_to game.title_ja, game
  end

  def activity_link
    return ' ' if activity.blank?

    link_to activity.day, activity
  end

  def show_link(text = nil)
    link_to text || 'Show', activity_activity_comment_path(model, activity_id: activity.id)
  end
end
