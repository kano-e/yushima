require 'rails_helper'

RSpec.describe "activity_comments/show", type: :view do
  before(:each) do
    @activity_comment = assign(:activity_comment, ActivityComment.create!(
      :activity => nil,
      :game => nil,
      :photo => "Photo",
      :detail => "Detail"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Photo/)
    expect(rendered).to match(/Detail/)
  end
end
