require 'rails_helper'

RSpec.describe "activities/index", type: :view do
  before(:each) do
    assign(:activities, [
      Activity.create!(),
      Activity.create!()
    ])
  end

  it "renders a list of activities" do
    render
  end
end
