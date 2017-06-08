class VolunteersController < ApplicationController
  before_action :set_volunteer, except: [:index, :create]

  def index
    @volunteers = Volunteer.all
  end

  def show
    
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    authorize! :create, @volunteer
    respond_to do |format|
      if @volunteer.save
        format.html { redirect_to volunteer_url(@volunteer) }
      else
        format.html { redirect_to main_app.root_url, notice: @volunteer.errors }
      end
    end
  end

  def update
    authorize! :update, @volunteer
    respond_to do |format|
      if @volunteer.update(volunteer_params)
        format.html { redirect_to volunteer_url(@volunteer) }
      else
        format.html { redirect_to main_app.root_url, notice: @volunteer.errors }
      end
    end
  end

  def destroy
    authorize! :destroy, @volunteer
    @volunteer.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private 

  def set_volunteer
    @volunteer = Volunteer.find(params[:id])
  end

  def volunteer_params
    params.require(:volunteer).permit(:id, :name, :phone, :bio, :city, :city_id).merge(user: current_user)
  end
end
