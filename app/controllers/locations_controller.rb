class LocationsController < InheritedResources::Base

	def new
		@location = Location.new
	end

	def create
		@location = Location.new(location_params)
		if @location.save
			redirect_to lunch_specials_path
		else
			render 'new', notice: "could not location your location. Please try again"
		end
	end

  private

    def location_params
      params.require(:location).permit(:address, :latitude, :longitude)
    end
end

