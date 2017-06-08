require 'rails_helper'

RSpec.describe "gigs/index", type: :view do
  before(:each) do
    assign(:gigs, [
      Gig.create!(
        :title => "Title",
        :description => "MyText",
        :number_of_available_candidatures => 2,
        :available => false
      ),
      Gig.create!(
        :title => "Title",
        :description => "MyText",
        :number_of_available_candidatures => 2,
        :available => false
      )
    ])
  end

  it "renders a list of gigs" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
