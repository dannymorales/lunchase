class RestaurantsController < InheritedResources::Base

  private

    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :city, :state, :zip_code, :telephone, :webpage)
    end
end

