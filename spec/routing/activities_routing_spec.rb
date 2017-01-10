require "rails_helper"

RSpec.describe ActivitiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/activities").to route_to("activities#index")
    end

    it "routes to #new" do
      expect(:get => "/activities/new").to route_to("activities#new")
    end

    it do
      expect(get: '/activities/2017-01-11').to route_to('activities#show', day: '2017-01-11')
    end

    it do
      expect(get: '/activities/2017-01-11/edit').to route_to('activities#edit', day: '2017-01-11')
    end

    it "routes to #create" do
      expect(:post => "/activities").to route_to("activities#create")
    end
    it do
      expect(put: '/activities/2017-01-11').to route_to('activities#update', day: '2017-01-11')
    end

    it do
      expect(patch: '/activities/2017-01-11').to route_to('activities#update', day: '2017-01-11')
    end

    it do
      expect(delete: '/activities/2017-01-11').to route_to('activities#destroy', day: '2017-01-11')
    end
  end
end
