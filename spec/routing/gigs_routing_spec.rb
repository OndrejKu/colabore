require "rails_helper"

RSpec.describe GigsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/gigs").to route_to("gigs#index")
    end

    it "routes to #new" do
      expect(:get => "/gigs/new").to route_to("gigs#new")
    end

    it "routes to #show" do
      expect(:get => "/gigs/1").to route_to("gigs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/gigs/1/edit").to route_to("gigs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/gigs").to route_to("gigs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/gigs/1").to route_to("gigs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/gigs/1").to route_to("gigs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/gigs/1").to route_to("gigs#destroy", :id => "1")
    end

  end
end
