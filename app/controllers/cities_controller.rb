class CitiesController < ApplicationController

  def index
    @cities = City.all.paginate(page: params[:page])

    unless params[:q].to_s.empty?
     like_query = "%#{params[:q].upcase}%"
     @cities = @cities.where("upper(name) like ? ", like_query)
   end
 end

end
