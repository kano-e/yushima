class Activity::Cell < Cell::ViewModel
  include ::Cell::Slim
  include ApplicationHelper

  property :day
  property :activity_comments

  def index
    render :index
  end

  def meta
    render :meta
  end

  def policy
    @policy ||= Activity::Policy.new(current_user, model)
  end

  def meta_title
    "#{day}の活動 - フィードフォース ボドゲ部"
  end

  def meta_description
    text = "フィードフォース ボドゲ部 #{day}の活動です。"
    if activity_comments.map { |comment| comment.game }.present?
      text += activity_comments.map { |comment| comment.game&.title_ja }.compact.uniq.join(', ')
      text += ' で遊びました！'
    end

    text
  end

  def meta_image
    if comment = activity_comments.sort_by(&:id).select { |comment| comment.photo.present? }.first
      return comment.photo.url(:ll)
    end
  end

  def title_tag
    content_tag(:title, meta_title)
  end

  def og_title_tag
    og_tag(:title, meta_title)
  end

  def og_url_tag
    og_tag(:url, activity_url(@model))
  end

  def og_description_tag
    og_tag(:description, meta_description)
  end

  def og_image_tag
    return og_tag(:image, meta_image) if meta_image
    default_og_image_tag
  end

  def tw_title_tag
    tw_tag(:title, meta_title)
  end

  def tw_url_tag
    tw_tag(:url, activity_url(@model))
  end

  def tw_description_tag
    tw_tag(:description, meta_description)
  end

  def tw_image_tag
    return tw_tag(:image, meta_image) if meta_image
    default_tw_image_tag
  end

  def show_link(text = nil)
    link_to text || day, model
  end

  def images
    [] if activity_comments.size.zero?
    activity_comments.select { |com| com.photo.present? }.first(3).map { |com| com.photo }
  end

  def show_images
    return if activity_comments.size.zero?

    activity_comments.select { |com| com.photo.present? }.first(3).map do |comment|
      content_tag(:div, class: 'column') do
        content_tag(:figure, class: 'image is-square') do
          image_tag comment.photo.url(:thumbnail)
        end
      end
    end.join
  end

  def games
    activity_comments.map(&:game).compact.uniq
  end

  def show_games
    games.map(&:title_ja).join(content_tag(:span, '｜'))
  end

  def link_to_games
    activity_comments.map(&:game).compact.uniq.map do |game|
      link_to game.title_ja, game
    end.join(content_tag(:span, '｜'))
  end
end
