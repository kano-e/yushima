class Game::Cell < Cell::ViewModel
  include ::Cell::Slim

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

    content_tag(:span, class: 'tag') do
      if min_players && max_players
        if min_players == max_players
          '%d players' % [min_players]
        else
          '%d 〜 %d players' % [min_players, max_players]
        end
      elsif min_players
        '%d 〜 players' % [min_players] if min_players
      else
        '〜 %d players' % [max_players] if max_players
      end
    end
  end

  def playing_time
    return if !min_minutes && !max_minutes

    content_tag(:span, class: 'tag') do
      if min_minutes && max_minutes
        if min_minutes == max_minutes
          '%d minutes' % [min_minutes]
        else
          '%d 〜 %d minutes' % [min_minutes, max_minutes]
        end
      elsif min_minutes
        '%d 〜 minutes' % [min_minutes] if min_minutes
      else
        '〜 %d minutes' % [max_minutes] if max_minutes
      end
    end
  end

  def show_link(text = nil)
    link_to text || title_ja, model
  end

  def index_image
    return if photo.blank?

    content_tag(:figure, class: 'image is-square') do
      image_tag(photo.url(:thumbnail))
    end
  end

  def heading_image
    return if photo.blank?

    content_tag(:figure, class: 'is-pulled-left', style: 'margin-right: 20px') do
      content_tag(:p, class: 'image is-128x128') do
        image_tag(photo.url(:thumbnail))
      end
    end
  end
end
