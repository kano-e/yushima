require 'rails_helper'

RSpec.describe "activities/show", type: :view do
  before(:each) do
    @activity = assign(:activity, Activity.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
