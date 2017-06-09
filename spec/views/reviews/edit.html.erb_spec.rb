require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :note => "9.99",
      :description => "MyText"
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do

      assert_select "input#review_note[name=?]", "review[note]"

      assert_select "textarea#review_description[name=?]", "review[description]"
    end
  end
end
