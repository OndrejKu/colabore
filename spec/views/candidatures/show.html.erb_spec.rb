require 'rails_helper'

RSpec.describe "candidatures/show", type: :view do
  before(:each) do
    @candidature = assign(:candidature, Candidature.create!(
      :introduction_letter => "MyText",
      :accepted => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
