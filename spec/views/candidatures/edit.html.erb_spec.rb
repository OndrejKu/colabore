require 'rails_helper'

RSpec.describe "candidatures/edit", type: :view do
  before(:each) do
    @candidature = assign(:candidature, Candidature.create!(
      :introduction_letter => "MyText",
      :accepted => false
    ))
  end

  it "renders the edit candidature form" do
    render

    assert_select "form[action=?][method=?]", candidature_path(@candidature), "post" do

      assert_select "textarea#candidature_introduction_letter[name=?]", "candidature[introduction_letter]"

      assert_select "input#candidature_accepted[name=?]", "candidature[accepted]"
    end
  end
end
