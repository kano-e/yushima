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

  def index_for_show_comment
    render :index_for_show_comment
  end

  def meta
    render :meta
  end

  def policy
    @policy ||= ActivityComment::Policy.new(current_user, model)
  end

  def meta_image
    return photo.url(:ll) if photo.present?
    return game.photo.url(:ll) if game && game.photo.present?
    nil
  end

  def meta_description
    text = "#{activity.day}の活動"
    if game
      text += " #{game.title_ja}"
    end

    text
  end

  def title_tag
    content_tag(:title, detail)
  end

  def og_title_tag
    og_tag(:title, detail)
  end

  def og_url_tag
    og_tag(:url, activity_activity_comment_url(model, activity_id: activity.id))
  end

  def og_description_tag
    og_tag(:description, meta_description)
  end

  def og_image_tag
    return og_tag(:image, meta_image) if meta_image
    default_og_image_tag
  end

  def tw_title_tag
    tw_tag(:title, detail)
  end

  def tw_description_tag
    tw_tag(:description, meta_description)
  end

  def tw_image_tag
    return tw_tag(:image, meta_image) if meta_image
    default_tw_image_tag
  end

  def show_username
    "@#{model.user.nickname}"
  end

  def show_image
    content_tag(:div, class: 'card-image') do
      image_url = if photo.present?
                    photo.url(:l)
                  elsif game && game.photo.present?
                    game.photo.url(:l)
                  else
                    'no-image-for-comment.jpg'
                  end
      show_link(image_tag(image_url))
    end
  end

  def card_image
    content_tag(:div, class: 'card-image') do
      image_url = if photo.present?
                    photo.url(:sm)
                  elsif game && game.photo.present?
                    game.photo.url(:sm)
                  else
                    'no-image-for-comment.jpg'
                  end
      show_link(image_tag(image_url))
    end
  end

  def card_action
    content_tag(:div, class: 'card-action right-align') do
      show_link
    end
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
