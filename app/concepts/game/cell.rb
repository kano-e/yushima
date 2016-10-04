class Game::Cell < Cell::ViewModel
  include ::Cell::Slim
  include ApplicationHelper

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

  def number_of_players
    return if !min_players && !max_players

    content_tag(:div, class: 'chip') do
      if min_players && max_players
        if min_players == max_players
          '%d 人' % [min_players]
        else
          '%d 〜 %d 人' % [min_players, max_players]
        end
      elsif min_players
        '%d 〜 人' % [min_players] if min_players
      else
        '〜 %d 人' % [max_players] if max_players
      end
    end
  end

  def playing_time
    return if !min_minutes && !max_minutes

    content_tag(:div, class: 'chip') do
      if min_minutes && max_minutes
        if min_minutes == max_minutes
          '%d 分' % [min_minutes]
        else
          '%d 〜 %d 分' % [min_minutes, max_minutes]
        end
      elsif min_minutes
        '%d 〜 分' % [min_minutes] if min_minutes
      else
        '〜 %d 分' % [max_minutes] if max_minutes
      end
    end
  end

  def show_link(text = nil)
    link_to text || title_ja, model
  end

  def index_image
    return if photo.blank?
    content_tag(:div, class: 'card-image') do
      image_tag(photo.url(:thumbnail), class: 'responsive-img')
    end
  end

  def index_title_en
    return if title_en.blank?
    content_tag(:p, title_en, class: 'blue-grey-text')
  end

  def heading_image
    return if photo.blank?
    content_tag(:div, class: 'card-image') do
      image_tag(photo.url(:standard), class: 'responsive-img')
    end
  end

  def heading_title_en
    return if title_en.blank?
    content_tag(:p, title_en, class: 'flow-text blue-grey-text')
  end
end
