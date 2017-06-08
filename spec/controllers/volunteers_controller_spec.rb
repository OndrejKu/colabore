require 'rails_helper'

RSpec.describe VolunteersController, type: :controller do
  include Devise::Test::ControllerHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @current_user = create(:user)
    sign_in @current_user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    context "volunteer exists" do
      it "returns http success" do
        volunteer = create(:volunteer)
        get :show, params: {id: volunteer.id}
        expect(response).to have_http_status(:success)
      end
    end

    context "volunteer doesn't exist" do
      it "redirects to volunteers index" do
        volunteer_attributes = attributes_for(:volunteer) 
        get :show, params: {id: 100}
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "POST #create" do
    before(:each) do
      @vol_attributes = attributes_for(:volunteer, user: @current_user)
      post :create, params: {volunteer: @vol_attributes}
    end
    
    context "valid volunteer" do
      it "redirects to volunteer" do
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to("/volunteers/#{Volunteer.last.id}")
      end

      it "with right arguments" do 
        expect(Volunteer.last.user).to eql(@current_user)
        expect(Volunteer.last.name).to eql(@vol_attributes.name)
        expect(Volunteer.last.city).to eql(@vol_attributes.city)
      end
    end
  end

  # describe "PATCH #update" do
  #   it "returns http created" do
  #     volunteer = FactoryGirl.create(:volunteer)
  #     patch :update, params: {id: volunteer.id}
  #     expect(response).to have_http_status(:created)
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "returns http deleted" do
  #     volunteer = FactoryGirl.create(:volunteer)
  #     delete :destroy, params: {id: volunteer.id}
  #     expect(response).to have_http_status(:destroyed)
  #   end
  # end

end
