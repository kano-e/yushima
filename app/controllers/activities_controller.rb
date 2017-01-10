class ActivitiesController < ApplicationController
  prepend_before_filter :authenticate!, only: [:new, :edit, :create, :update, :destroy]

  # GET /activities
  def index
    today = Time.current.to_date
    @activities = Activity.all.
      where(day: today.beginning_of_month..today.end_of_month).
      order(day: :desc).includes(activity_comments: :game)
    @activity_policy = Activity::Policy.new(current_user, nil)
    set_content_ids
  end

  # GET /activities/1
  def show
    present Activity::Update
    redirect_to_day_url && return
    @activity_comment_form = ActivityComment::Create.present(params)
    @activity_comment_policy = ActivityComment::Policy.new(current_user, @activity_comment_form.model)
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
    set_content_ids(*@model.comments.map { |c| "activity_comment_#{c.id}" })
    record_event_item_ids
  end

  def redirect_to_day_url
    return if /\d{4}-\d{2}-\d{2}/ =~ params[:day]
    redirect_to activity_path(day: @model.day)
  end
end
