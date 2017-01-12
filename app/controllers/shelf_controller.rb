class ShelfController < ApplicationController
  def show
    @games = Game.at_feedforce.order_by_title
    @game_policy = Game::Policy.new(current_user, nil)
    set_content_ids
  end
end
