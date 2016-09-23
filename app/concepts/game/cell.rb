class Game::Cell < Cell::ViewModel
  include ::Cell::Slim

  property :title_ja
  property :title_en
  property :min_players
  property :max_players
  property :min_minutes
  property :max_minutes

  def index
    render :index
  end

  def number_of_players
    return '%d 〜 %d' % [min_players, max_players] if min_players && max_players
    return '%d 〜' % [min_players] if min_players
    return '〜 %d' % [max_players] if max_players
    nil
  end

  def playing_time
    return '%d 〜 %d (minutes)' % [min_minutes, max_minutes] if min_minutes && max_minutes
    return '%d 〜 (minutes)' % [min_minutes] if min_minutes
    return '〜 %d (minutes)' % [max_minutes] if max_minutes
    nil
  end

  def show_link
    link_to 'Show', model
  end
end
