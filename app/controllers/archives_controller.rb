class ArchivesController < ApplicationController
  def show
    day = Time.zone.parse("#{params[:year_month]}-01").to_date
    @activities = Activity.all.
      where(day: day..day.end_of_month).
      order(day: :asc).includes(activity_comments: :game)
    @activity_policy = Activity::Policy.new(current_user, nil)
    set_content_ids

    render 'activities/index'
  end
end
