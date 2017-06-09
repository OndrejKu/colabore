class ReviewsController < ApplicationController
  before_action :set_reviewable
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = @reviewable.reviews.all.paginate(page: params[:page])
  end

  def show
  end

  def new
    @review = @reviewable.reviews.build
  end

  def edit
  end

  def create
    @review = @reviewable.reviews.build(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_reviewable
      type = params[:reviewable_type]
      if type == 'Volunteer'
        @reviewable = Volunteer.find(params[:reviewable_id])
      else
        @reviewable = Organization.find(params[:reviewable_id])
      end
    end

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:reviewable_id, :reviewable_type, :note, :description)
    end
end
