require "rails_helper"

RSpec.describe ActivityCommentsController, type: :routing do
  describe "routing" do
    it do
      expect(get: '/activities/2017-01-11/activity_comments/2').
        to route_to('activity_comments#show', activity_day: '2017-01-11', id: '2')
    end
  end
end
