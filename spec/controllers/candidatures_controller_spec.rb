require 'rails_helper'


RSpec.describe CandidaturesController, type: :controller do
  let(:volunteer) { create(:volunteer) }
  let(:gig) { create(:gig) }

  let(:valid_attributes) {
    {
      gig_id: gig.id,
      volunteer_id: volunteer.id,
      introduction_letter: 'Im here to help the dogs',
      accepted: false
    }
  }

  let(:invalid_attributes) {
    {
      gig_id: nil,
      volunteer_id: nil,
      introduction_letter: ""
    }
  }

  let(:valid_session) { {} }


  describe "GET #index" do
    it "returns a success response" do
      candidature = Candidature.create! valid_attributes
      get :index, params: {gig_id: gig.id}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      candidature = Candidature.create! valid_attributes
      get :show, params: {gig_id: gig.id, id: candidature.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {gig_id: gig.id}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      candidature = Candidature.create! valid_attributes
      get :edit, params: {gig_id: gig.id, id: candidature.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Candidature" do
        expect {
          post :create, params: {gig_id: gig.id, candidature: valid_attributes}, session: valid_session
        }.to change(Candidature, :count).by(1)
      end

      it "redirects to the created candidature" do
        post :create, params: {gig_id: gig.id, candidature: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Candidature.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {gig_id: gig.id, candidature: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          introduction_letter: "Im also wanna help the cats"
        }
      }

      it "updates the requested candidature" do
        candidature = Candidature.create! valid_attributes
        put :update, params: {gig_id: gig.id, id: candidature.to_param, candidature: new_attributes}, session: valid_session
        candidature.reload
        expect(candidature.introduction_letter).to eq(new_attributes[:introduction_letter])
      end

      it "redirects to the candidature" do
        candidature = Candidature.create! valid_attributes
        put :update, params: {gig_id: gig.id, id: candidature.to_param, candidature: valid_attributes}, session: valid_session
        expect(response).to redirect_to(candidature)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        candidature = Candidature.create! valid_attributes
        put :update, params: {gig_id: gig.id, id: candidature.to_param, candidature: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested candidature" do
      candidature = Candidature.create! valid_attributes
      expect {
        delete :destroy, params: {gig_id: gig.id, id: candidature.to_param}, session: valid_session
      }.to change(Candidature, :count).by(-1)
    end

    it "redirects to the candidatures list" do
      candidature = Candidature.create! valid_attributes
      delete :destroy, params: {gig_id: gig.id, id: candidature.to_param}, session: valid_session
      expect(response).to redirect_to(candidatures_url)
    end
  end

end
