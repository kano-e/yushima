class Game::Cell < Cell::ViewModel
  include ::Cell::Slim
  include ApplicationHelper
  include FontAwesome::Rails::IconHelper
  include ActionView::Helpers::CaptureHelper

  property :title_ja
  property :title_en
  property :min_players
  property :max_players
  property :min_minutes
  property :max_minutes
  property :photo

  def index
    render :index
  end

  def meta
    render :meta
  end

  def number_of_players_text
    return if !min_players && !max_players

    text = if min_players && max_players
      if min_players == max_players
        ' %d 人' % [min_players]
      else
        ' %d 〜 %d 人' % [min_players, max_players]
      end
    elsif min_players
      ' %d 〜 人' % [min_players] if min_players
    else
      ' 〜 %d 人' % [max_players] if max_players
    end
  end

  def playing_time_text
    return if !min_minutes && !max_minutes

    text = if min_minutes && max_minutes
      if min_minutes == max_minutes
        ' %d 分' % [min_minutes]
      else
        ' %d 〜 %d 分' % [min_minutes, max_minutes]
      end
    elsif min_minutes
      ' %d 〜 分' % [min_minutes] if min_minutes
    else
      ' 〜 %d 分' % [max_minutes] if max_minutes
    end
  end

  def meta_title
    "#{title_ja} - フィードフォース ボドゲ部 ボドゲリスト"
  end

  def title_tag
    content_tag(:title, meta_title)
  end

  def og_title_tag
    og_tag(:title, meta_title)
  end

  def og_url_tag
    og_tag(:url, game_url(model))
  end

  def og_description_tag
    og_tag(:description, [title_ja, title_en.presence, number_of_players_text, playing_time_text].compact.join(' / '))
  end

  def og_image_tag
    return og_tag(:image, photo.url(:ll)) if photo.present?

    if comment = activity_comments.select { |comment| comment.photo.present? }.first
      return og_tag(:image, comment.photo.url(:ll))
    end

    default_og_image_tag
  end

  def exists_players_or_time?
    min_players || max_players || min_minutes || max_minutes
  end

  def number_of_players
    return if !min_players && !max_players

    content_tag(:div, class: 'col') do
      fa_icon('users') + number_of_players_text
    end
  end

  def playing_time
    return if !min_minutes && !max_minutes

    content_tag(:div, class: 'col') do
      fa_icon('clock-o') + playing_time_text
    end
  end

  def show_link(text = nil)
    link_to text || title_ja, model
  end

  def index_image
    return if photo.blank?
    content_tag(:div, class: 'col s3 m3 l2 right') do
      show_link(image_tag(photo.url(:ss), class: 'responsive-img circle'))
    end
  end

  def index_title_en
    return if title_en.blank?
    content_tag(:p, title_en, class: 'blue-grey-text')
  end

  def heading_image
    return if photo.blank?
    image_tag(photo.url(:m), class: 'responsive-img')
  end

  def heading_title_en
    return if title_en.blank?
    content_tag(:p, class: 'flow-text blue-grey-text') do
      content_tag(:small, title_en)
    end
  end
end
