class GamesController < ApplicationController
  # GET /games
  def index
    @games = Game.all
  end

  # GET /games/1
  def show
    present Comment::Update
  end

  # GET /games/new
  def new
    form Comment::Create
  end

  # GET /games/1/edit
  def edit
    form Comment::Update
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
    run Game::Update do |op|
      return redirect_to(games_path, notice: 'Game was successfully destroyed.')
    end

    redirect_back(fallback_location: game_path(params[:id]))
  end
end
