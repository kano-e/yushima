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

  def standard_image
    return if photo.blank?

    content_tag(:div, class: 'card-image') do
      image_tag(photo.url(:standard))
    end
  end

  def card_image
    return if photo.blank?

    content_tag(:div, class: 'card-image') do
      show_link(image_tag(photo.url(:thumbnail)))
    end
  end

  def card_content
    return if detail.blank?

    content_tag(:div, class: 'card-content') do
      content_tag(:div, class: 'content') do
        show_detail
      end
    end
  end

  def card_action
    content_tag(:div, class: 'card-action right-align') do
      show_link
    end
  end

  def show_detail
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
