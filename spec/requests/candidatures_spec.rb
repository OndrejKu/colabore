require 'rails_helper'

RSpec.describe "Candidatures", type: :request do
  describe "GET /candidatures" do
    it "works! (now write some real specs)" do
      get candidatures_path
      expect(response).to have_http_status(200)
    end
  end
end
