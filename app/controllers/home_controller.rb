class HomeController < ApplicationController
  def index
    @activities = Activity.all.order(day: :desc).includes(activity_comments: :game).limit(12)
  end
end
