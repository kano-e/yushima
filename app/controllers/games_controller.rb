class GamesController < ApplicationController
  prepend_before_filter :authenticate!, only: [:new, :edit, :create, :update, :destroy]

  # GET /games
  def index
    @games = Game.all.order_by_title
    @game_policy = Game::Policy.new(current_user, nil)
    set_content_ids
  end

  # GET /games/1
  def show
    present Game::Show
    @activity_comments = @model.activity_comments.includes(:activity).order(id: :desc).limit(20).all
    set_item_id
  end

  # GET /games/new
  def new
    form Game::Create
  end

  # GET /games/1/edit
  def edit
    form Game::Update
  end

  # POST /games
  def create
    run Game::Create do |op|
      return redirect_to(op.model, notice: 'Game was successfully created.')
    end

    render :new
  end

  # PATCH/PUT /games/1
  def update
    run Game::Update do |op|
      return redirect_to(op.model, notice: 'Game was successfully updated.')
    end

    render :edit
  end

  # DELETE /games/1
  def destroy
    run Game::Destroy do |op|
      return redirect_to(games_path, notice: 'Game was successfully destroyed.')
    end

    redirect_back(fallback_location: game_path(params[:id]))
  end

  private

  def set_item_id
    set_content_ids(*@activity_comments.map { |c| "activity_comment_#{c.id}" })
    record_event_item_ids
  end
end
