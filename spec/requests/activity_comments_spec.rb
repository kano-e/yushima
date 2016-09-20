require 'rails_helper'

RSpec.describe "ActivityComments", type: :request do
  describe "GET /activity_comments" do
    it "works! (now write some real specs)" do
      get activity_comments_path
      expect(response).to have_http_status(200)
    end
  end
end
