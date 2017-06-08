class GigsController < ApplicationController
  before_action :set_organization
  before_action :set_gig, only: [:show, :edit, :update, :destroy]

  def index
    @gigs = @organization.gigs.all #paginate(page: params[:page])
  end

  def show
  end

  def new
    @gig = @organization.gigs.build
  end

  def edit
  end

  def create
    @gig = @organization.gigs.build(gig_params)

    respond_to do |format|
      if @gig.save
        format.html { redirect_to @gig, notice: 'Gig was successfully created.' }
        format.json { render :show, status: :created, location: @gig }
      else
        format.html { render :new }
        format.json { render json: @gig.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @gig.update(gig_params)
        format.html { redirect_to @gig, notice: 'Gig was successfully updated.' }
        format.json { render :show, status: :ok, location: @gig }
      else
        format.html { render :edit }
        format.json { render json: @gig.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @gig.destroy
    respond_to do |format|
      format.html { redirect_to gigs_url, notice: 'Gig was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_organization
      @organization = Organization.find(params[:organization_id])
    end

    def set_gig
      @gig = @organization.gigs.find(params[:id])
    end

    def gig_params
      params.require(:gig).permit(:title, :description, :start_date, :end_date, :number_of_available_candidatures, :available, :organization_id)
    end
end
