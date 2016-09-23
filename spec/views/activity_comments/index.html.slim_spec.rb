require 'rails_helper'

RSpec.describe "activity_comments/index", type: :view do
  before(:each) do
    assign(:activity_comments, [
      ActivityComment.create!(
        :activity => nil,
        :game => nil,
        :photo => "Photo",
        :detail => "Detail"
      ),
      ActivityComment.create!(
        :activity => nil,
        :game => nil,
        :photo => "Photo",
        :detail => "Detail"
      )
    ])
  end

  it "renders a list of activity_comments" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Photo".to_s, :count => 2
    assert_select "tr>td", :text => "Detail".to_s, :count => 2
  end
end
