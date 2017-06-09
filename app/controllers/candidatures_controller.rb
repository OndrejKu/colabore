class CandidaturesController < ApplicationController
  before_action :set_gig
  before_action :set_candidature, only: [:show, :edit, :update, :destroy]

  def index
    @candidatures = @gig.candidatures.all.paginate(page: params[:page])
  end

  def show
  end

  def new
    @candidature = @gig.candidatures.build
  end

  def edit
  end

  def create
    @candidature = @gig.candidatures.build(candidature_params)

    respond_to do |format|
      if @candidature.save
        format.html { redirect_to @candidature, notice: 'Candidature was successfully created.' }
        format.json { render :show, status: :created, location: @candidature }
      else
        format.html { render :new }
        format.json { render json: @candidature.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @candidature.update(candidature_params)
        format.html { redirect_to @candidature, notice: 'Candidature was successfully updated.' }
        format.json { render :show, status: :ok, location: @candidature }
      else
        format.html { render :edit }
        format.json { render json: @candidature.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @candidature.destroy
    respond_to do |format|
      format.html { redirect_to candidatures_url, notice: 'Candidature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_gig
      @gig = Gig.find(params[:gig_id])
    end

    def set_candidature
      @candidature = Candidature.find(params[:id])
    end

    def candidature_params
      params.require(:candidature).permit(:gig_id, :volunteer_id, :introduction_letter, :accepted)
    end
end
