class ActivityCommentsController < ApplicationController
  prepend_before_filter :authenticate!, only: [:new, :edit, :create, :update, :destroy]

  # GET /activity_comments
  def index
    @activity = Activity.find(params[:activity_id])
    @activity_comments = @activity.activity_comments.order(id: :asc).includes(:game)
  end

  # GET /activity_comments/1
  def show
    @activity = Activity::Update.present(params).model
    present ActivityComment::Update
    @activity_comments = @activity.activity_comments.where.not(id: @model.id).order(id: :asc).to_a
    comment_counts = @activity_comments.count
    if comment_counts < 30 && @model.game.present?
      @activity_comments += @model.game.activity_comments.where.not(id: @activity_comments.map(&:id) + [@model.id]).order(id: :desc).limit(30 - comment_counts).to_a
    end
    set_item_id
  end

  # GET /activity_comments/new
  def new
    form ActivityComment::Create
  end

  # GET /activity_comments/1/edit
  def edit
    form ActivityComment::Update
  end

  # POST /activity_comments
  def create
    run ActivityComment::Create do |op|
      return redirect_to(activity_path(params[:activity_id], anchor: 'activity-comment-form'), notice: 'Activity was successfully created.')
    end

    render :new
  end

  # PATCH/PUT /activity_comments/1
  def update
    run ActivityComment::Update do |op|
      return redirect_to(activity_path(params[:activity_id], anchor: 'activity-comment-form'), notice: 'Activity was successfully updated.')
    end

    render :edit
  end

  # DELETE /activity_comments/1
  def destroy
    run ActivityComment::Destroy do |op|
      return redirect_to(activity_path(id: params[:activity_id]), notice: 'Activity comment was successfully destroyed.')
    end

    redirect_back(fallback_location: activity_activity_comment_path(params[:id], activity_id: params[:activity_id]))
  end

  private

  def set_item_id
    set_content_ids("activity_comment_#{@model.id}")
    record_event_item_ids
  end
end
