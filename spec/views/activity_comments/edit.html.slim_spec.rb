require 'rails_helper'

RSpec.describe "activity_comments/edit", type: :view do
  before(:each) do
    @activity_comment = assign(:activity_comment, ActivityComment.create!(
      :activity => nil,
      :game => nil,
      :photo => "MyString",
      :detail => "MyString"
    ))
  end

  it "renders the edit activity_comment form" do
    render

    assert_select "form[action=?][method=?]", activity_comment_path(@activity_comment), "post" do

      assert_select "input#activity_comment_activity_id[name=?]", "activity_comment[activity_id]"

      assert_select "input#activity_comment_game_id[name=?]", "activity_comment[game_id]"

      assert_select "input#activity_comment_photo[name=?]", "activity_comment[photo]"

      assert_select "input#activity_comment_detail[name=?]", "activity_comment[detail]"
    end
  end
end
