class ActivityCommentsController < ApplicationController
  before_action :set_activity_comment, only: [:show, :edit, :update, :destroy]

  # GET /activity_comments
  def index
    @activity_comments = ActivityComment.all
  end

  # GET /activity_comments/1
  def show
  end

  # GET /activity_comments/new
  def new
    @activity_comment = ActivityComment.new
  end

  # GET /activity_comments/1/edit
  def edit
  end

  # POST /activity_comments
  def create
    run ActivityComment::Create do |op|
      return redirect_to(op.model.activity, notice: 'Activity was successfully created.')
    end

    render :new
  end

  # PATCH/PUT /activity_comments/1
  def update
    if @activity_comment.update(activity_comment_params)
      redirect_to @activity_comment, notice: 'Activity comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /activity_comments/1
  def destroy
    @activity_comment.destroy
    redirect_to activity_comments_url, notice: 'Activity comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_comment
      @activity_comment = ActivityComment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def activity_comment_params
      params.require(:activity_comment).permit(:activity_id, :game_id, :photo, :detail)
    end
end
