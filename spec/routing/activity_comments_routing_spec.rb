require "rails_helper"

RSpec.describe ActivityCommentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/activity_comments").to route_to("activity_comments#index")
    end

    it "routes to #new" do
      expect(:get => "/activity_comments/new").to route_to("activity_comments#new")
    end

    it "routes to #show" do
      expect(:get => "/activity_comments/1").to route_to("activity_comments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/activity_comments/1/edit").to route_to("activity_comments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/activity_comments").to route_to("activity_comments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/activity_comments/1").to route_to("activity_comments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/activity_comments/1").to route_to("activity_comments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/activity_comments/1").to route_to("activity_comments#destroy", :id => "1")
    end

  end
end
