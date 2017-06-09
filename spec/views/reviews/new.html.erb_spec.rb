require 'rails_helper'

RSpec.describe "reviews/new", type: :view do
  before(:each) do
    assign(:review, Review.new(
      :note => "9.99",
      :description => "MyText"
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "input#review_note[name=?]", "review[note]"

      assert_select "textarea#review_description[name=?]", "review[description]"
    end
  end
end
