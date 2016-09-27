class GamesController < ApplicationController
  # GET /games
  def index
    @games = Game.all.order(title_en: :asc)
  end

  # GET /games/1
  def show
    present Game::Update
    @activity_comments = @model.activity_comments.includes(:activity).order(id: :desc).limit(20).all
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
end
