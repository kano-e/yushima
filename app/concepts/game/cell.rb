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
    '%d 〜 %d' % [min_players, max_players]
  end

  def playing_time
    '%d 〜 %d minutes' % [min_minutes, max_minutes]
  end
end
