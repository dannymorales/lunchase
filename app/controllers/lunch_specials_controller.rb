class LunchSpecialsController < InheritedResources::Base

  private

    def lunch_special_params
      params.require(:lunch_special).permit(:title, :description, :restaurant, :address, :city, :state, :zip_code, :image_name, :image_content_type, :image_file_size, :price, :calories)
    end
end

