class VolunteersController < ApplicationController
  before_action :set_volunteer, except: [:index, :create]

  def index
    @volunteers = Volunteer.all
  end

  def show
    
  end

  def create
    # TODO authentication
    @volunteer = Volunteer.new(volunteer_params)

    respond_to do |format|
      if @volunteer.save
        format.html { redirect_to show_volunteer_url(@volunteer) }
      else
        format.html { redirect_to main_app.root_url, notice: @volunteer.errors }
      end
    end
  end

  def update
  end

  def destroy
  end

  private 

  def set_volunteer
    @volunteer = Volunteer.find(params[:id])
  end

  def volunteer_params
    params.require(:volunteer).permit(:id, :name).merge(user: current_user)
  end
end
