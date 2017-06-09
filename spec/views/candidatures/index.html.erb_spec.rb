require 'rails_helper'

RSpec.describe "candidatures/index", type: :view do
  before(:each) do
    assign(:candidatures, [
      Candidature.create!(
        :introduction_letter => "MyText",
        :accepted => false
      ),
      Candidature.create!(
        :introduction_letter => "MyText",
        :accepted => false
      )
    ])
  end

  it "renders a list of candidatures" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
