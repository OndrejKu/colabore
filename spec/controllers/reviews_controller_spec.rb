require 'rails_helper'


RSpec.describe ReviewsController, type: :controller do
  let(:volunteer) { create(:volunteer) }

  let(:valid_attributes) {
    {
      reviewable_type: volunteer.reviewable_type,
      reviewable_id: volunteer.id,
      note: 9,
      description: 'Nice guy, he cares bout the lill dogs'
    }
  }

  let(:invalid_attributes) {
    {
      reviewable_type: volunteer.reviewable_type,
      reviewable_id: volunteer.id,
      note: nil
    }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      review = Review.create! valid_attributes
      get :index, params: {reviewable_type: volunteer.reviewable_type, reviewable_id: volunteer.id}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      review = Review.create! valid_attributes
      get :show, params: {reviewable_type: volunteer.reviewable_type, reviewable_id: volunteer.id, id: review.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {reviewable_type: volunteer.reviewable_type, reviewable_id: volunteer.id}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      review = Review.create! valid_attributes
      get :edit, params: {reviewable_type: volunteer.reviewable_type, reviewable_id: volunteer.id, id: review.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Review" do
        expect {
          post :create, params: {reviewable_type: volunteer.reviewable_type, reviewable_id: volunteer.id, review: valid_attributes}, session: valid_session
        }.to change(Review, :count).by(1)
      end

      it "redirects to the created review" do
        post :create, params: {reviewable_type: volunteer.reviewable_type, reviewable_id: volunteer.id, review: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Review.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {reviewable_type: volunteer.reviewable_type, reviewable_id: volunteer.id, review: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          description: 'Btw, he also cares bout the cats'
        }
      }

      it "updates the requested review" do
        review = Review.create! valid_attributes
        put :update, params: {reviewable_type: volunteer.reviewable_type, reviewable_id: volunteer.id, id: review.to_param, review: new_attributes}, session: valid_session
        review.reload
        expect(review.description).to eq(new_attributes[:description])
      end

      it "redirects to the review" do
        review = Review.create! valid_attributes
        put :update, params: {reviewable_type: volunteer.reviewable_type, reviewable_id: volunteer.id, id: review.to_param, review: valid_attributes}, session: valid_session
        expect(response).to redirect_to(review)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        review = Review.create! valid_attributes
        put :update, params: {reviewable_type: volunteer.reviewable_type, reviewable_id: volunteer.id, id: review.to_param, review: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested review" do
      review = Review.create! valid_attributes
      expect {
        delete :destroy, params: {reviewable_type: volunteer.reviewable_type, reviewable_id: volunteer.id, id: review.to_param}, session: valid_session
      }.to change(Review, :count).by(-1)
    end

    it "redirects to the reviews list" do
      review = Review.create! valid_attributes
      delete :destroy, params: {reviewable_type: volunteer.reviewable_type, reviewable_id: volunteer.id, id: review.to_param}, session: valid_session
      expect(response).to redirect_to(reviews_url)
    end
  end

end
