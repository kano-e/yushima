class ActivitiesController < ApplicationController
  prepend_before_filter :authenticate!, only: [:new, :edit, :create, :update, :destroy]

  # GET /activities
  def index
    @activities = Activity.all.order(day: :desc).includes(activity_comments: :game)
    set_content_ids
  end

  # GET /activities/1
  def show
    present Activity::Update
    @activity_comments = @model.activity_comments.includes(:game).order(id: :asc).all
    @activity_comment_form = ActivityComment::Create.present(params)
    set_item_id
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
    run Activity::Update do |op|
      return redirect_to(op.model, notice: 'Activity was successfully updated.')
    end

    render :edit
  end

  # DELETE /activities/1
  def destroy
    run Activity::Destroy do |op|
      return redirect_to(activities_path, notice: 'Activity was successfully destroyed.')
    end

    redirect_back(fallback_location: activity_path(params[:id]))
  end

  private

  def set_item_id
    set_content_ids(*@activity_comments.map { |c| "activity_comment_#{c.id}" })
    record_event_item_ids
  end
end
