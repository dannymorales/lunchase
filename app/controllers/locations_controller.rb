class LocationsController < InheritedResources::Base

	def new
		@location = Location.new(location_params)
	end

	def create
		@location = Location.new(location_params)
		if @location.save
			redirect_to lunch_specials_path
		else
			render 'new', notice: "could not location your location. Please try again"
		end
	end

	def show
		
	end
  private

    def location_params
      params.require(:location).permit(:address, :latitude, :longitude)
    end
end

