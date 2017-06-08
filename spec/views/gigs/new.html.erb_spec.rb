require 'rails_helper'

RSpec.describe "gigs/new", type: :view do
  before(:each) do
    assign(:gig, Gig.new(
      :title => "MyString",
      :description => "MyText",
      :number_of_available_candidatures => 1,
      :available => false
    ))
  end

  it "renders new gig form" do
    render

    assert_select "form[action=?][method=?]", gigs_path, "post" do

      assert_select "input#gig_title[name=?]", "gig[title]"

      assert_select "textarea#gig_description[name=?]", "gig[description]"

      assert_select "input#gig_number_of_available_candidatures[name=?]", "gig[number_of_available_candidatures]"

      assert_select "input#gig_available[name=?]", "gig[available]"
    end
  end
end
