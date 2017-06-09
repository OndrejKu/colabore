require 'rails_helper'

RSpec.describe "candidatures/new", type: :view do
  before(:each) do
    assign(:candidature, Candidature.new(
      :introduction_letter => "MyText",
      :accepted => false
    ))
  end

  it "renders new candidature form" do
    render

    assert_select "form[action=?][method=?]", candidatures_path, "post" do

      assert_select "textarea#candidature_introduction_letter[name=?]", "candidature[introduction_letter]"

      assert_select "input#candidature_accepted[name=?]", "candidature[accepted]"
    end
  end
end
