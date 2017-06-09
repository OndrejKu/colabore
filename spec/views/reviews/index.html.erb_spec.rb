require 'rails_helper'

RSpec.describe "reviews/index", type: :view do
  before(:each) do
    assign(:reviews, [
      Review.create!(
        :note => "9.99",
        :description => "MyText"
      ),
      Review.create!(
        :note => "9.99",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of reviews" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
