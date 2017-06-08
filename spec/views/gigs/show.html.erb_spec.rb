require 'rails_helper'

RSpec.describe "gigs/show", type: :view do
  before(:each) do
    @gig = assign(:gig, Gig.create!(
      :title => "Title",
      :description => "MyText",
      :number_of_available_candidatures => 2,
      :available => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
  end
end
