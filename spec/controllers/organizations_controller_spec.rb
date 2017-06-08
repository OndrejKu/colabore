require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

  let(:user) { create(:user, :kind_organization)}
  let(:city) { create(:city) }

  let(:valid_attributes) {
    {
      user_id: user.id,
      city_id: city.id,
      name: "TheOrg",
      phone: "9999-9999",
      address: "221B Baker Street",
      description: "A very nice organization that helps poor lost little dogs"
    }
  }

  let(:invalid_attributes) {
    {
      user: nil,
      name: "",
      phone: ""
    }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      organization = Organization.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      organization = Organization.create! valid_attributes
      get :show, params: {id: organization.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      organization = Organization.create! valid_attributes
      get :edit, params: {id: organization.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Organization" do
        expect {
          post :create, params: {organization: valid_attributes}, session: valid_session
        }.to change(Organization, :count).by(1)
      end

      it "redirects to the created organization" do
        post :create, params: {organization: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Organization.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {organization: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name: "New Name"
        }
      }

      it "updates the requested organization" do
        organization = Organization.create! valid_attributes
        put :update, params: {id: organization.to_param, organization: new_attributes}, session: valid_session
        organization.reload
        expect(organization.name).to eq(new_attributes[:name])
      end

      it "redirects to the organization" do
        organization = Organization.create! valid_attributes
        put :update, params: {id: organization.to_param, organization: valid_attributes}, session: valid_session
        expect(response).to redirect_to(organization)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        organization = Organization.create! valid_attributes
        put :update, params: {id: organization.to_param, organization: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested organization" do
      organization = Organization.create! valid_attributes
      expect {
        delete :destroy, params: {id: organization.to_param}, session: valid_session
      }.to change(Organization, :count).by(-1)
    end

    it "redirects to the organizations list" do
      organization = Organization.create! valid_attributes
      delete :destroy, params: {id: organization.to_param}, session: valid_session
      expect(response).to redirect_to(organizations_url)
    end
  end

end
