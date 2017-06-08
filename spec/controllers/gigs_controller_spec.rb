require 'rails_helper'

RSpec.describe GigsController, type: :controller do
  let(:user) { create(:user, :kind_organization) }
  let(:organization) { create(:organization, user: user) }

  let(:valid_attributes) {
    {
      title: "Help the dogs!",
      description: "Lets help the poor lill dogs!",
      start_date: DateTime.now,
      end_date: DateTime.now + 2.days,
      number_of_available_candidatures: 5,
      available: true,
      organization_id: organization.id
    }
  }

  let(:invalid_attributes) {
    {
      title: '',
      description: '',
      start_date: DateTime.now,
      end_date: DateTime.now - 1.day,
    }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      gig = Gig.create! valid_attributes
      get :index, params: {organization_id: organization.id}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      gig = Gig.create! valid_attributes
      get :show, params: {organization_id: organization.id, id: gig.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {organization_id: organization.id}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      gig = Gig.create! valid_attributes
      get :edit, params: {organization_id: organization.id, id: gig.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Gig" do
        expect {
          post :create, params: {organization_id: organization.id, gig: valid_attributes}, session: valid_session
        }.to change(Gig, :count).by(1)
      end

      it "redirects to the created gig" do
        post :create, params: {organization_id: organization.id, gig: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Gig.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {organization_id: organization.id, gig: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          title: "Help the cats too!"
        }
      }

      it "updates the requested gig" do
        gig = Gig.create! valid_attributes
        put :update, params: {organization_id: organization.id, id: gig.to_param, gig: new_attributes}, session: valid_session
        gig.reload
        expect(gig.title).to eq(new_attributes[:title])
      end

      it "redirects to the gig" do
        gig = Gig.create! valid_attributes
        put :update, params: {organization_id: organization.id, id: gig.to_param, gig: valid_attributes}, session: valid_session
        expect(response).to redirect_to(gig)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        gig = Gig.create! valid_attributes
        put :update, params: {organization_id: organization.id, id: gig.to_param, gig: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested gig" do
      gig = Gig.create! valid_attributes
      expect {
        delete :destroy, params: {organization_id: organization.id, id: gig.to_param}, session: valid_session
      }.to change(Gig, :count).by(-1)
    end

    it "redirects to the gigs list" do
      gig = Gig.create! valid_attributes
      delete :destroy, params: {organization_id: organization.id, id: gig.to_param}, session: valid_session
      expect(response).to redirect_to(gigs_url)
    end
  end
end
