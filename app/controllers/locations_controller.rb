class LocationsController < InheritedResources::Base

	def show
		@location = Location.last
		@lunch_specials = LunchSpecial.all
	end
  private

    def location_params
      params.require(:location).permit(:address, :latitude, :longitude)
    end
end

