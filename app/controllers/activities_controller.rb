class ActivitiesController < ApplicationController
  # GET /activities
  def index
    @activities = Activity.all
  end

  # GET /activities/1
  def show
    present Activity::Update
    @activity_comment_form = ActivityComment::Create.present(params)
  end

  # GET /activities/new
  def new
    form Activity::Create
  end

  # GET /activities/1/edit
  def edit
    form Activity::Update
  end

  # POST /activities
  def create
    run Activity::Create do |op|
      return redirect_to(op.model, notice: 'Activity was successfully created.')
    end

    render :new
  end

  # PATCH/PUT /activities/1
  def update
    run Activity::Create do |op|
      return redirect_to(op.model, notice: 'Activity was successfully updated.')
    end

    render :edit
  end

  # DELETE /activities/1
  def destroy
    run Game::Destroy do |op|
      return redirect_to(activities_path, notice: 'Activity was successfully destroyed.')
    end

    redirect_back(fallback_location: game_path(params[:id]))
  end
end
