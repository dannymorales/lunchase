class LunchSpecialsController < InheritedResources::Base
	before_action :authenticate_user!, except: [:index, :show]

	

	def index
		@location = Location.last
		@lunch_specials = LunchSpecial.near([@location.latitude, @location.longitude], 5)
		@q = @lunch_specials.ransack(params[:q])
  		@lunch_special = @q.result(distinct: true)
  		@q.build_condition
	end

	def new
		@lunch_special = current_user.lunch_special.build
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@lunch_special = @restaurant.lunch_specials.create(lunch_special_params)
	 	@lunch_special.restaurant
	 	@lunch_special.address = @restaurant.address + " " + @restaurant.city + ", " + @restaurant.state
	 	@lunch_special.latitude = @restaurant.latitude
	 	@lunch_special.longitude = @restaurant.longitude
		if @lunch_special.save
			redirect_to @lunch_special, notice: "A new lunch special was created"
		else
			render "new"
		end	
	end
	def show
		@lunch_special = LunchSpecial.find(params[:id])
		@lunch_special.restaurant
		@hash = Gmaps4rails.build_markers(@lunch_special.restaurant) do |restaurant, marker|
  			marker.lat restaurant.latitude
  			marker.lng restaurant.longitude
  		end
	end

	def edit
		@lunch_special = LunchSpecial.find(params[:id])
		@lunch_special.restaurant
	end

	def update
		@lunch_special = LunchSpecial.find(params[:id])
		if @lunch_special.update(lunch_special_params)
			redirect_to @lunch_special
		else
			render 'edit'
		end
	end

	def destroy
		@lunch_special = LunchSpecial.find(params[:id])
		@lunch_special.destroy
		redirect_to lunch_specials_path
	end

	def upvote
		@lunch_special = LunchSpecial.find(params[:id])
		@lunch_special.upvote_by current_user
		redirect_to :back

	end

	def downvote
		@lunch_special = LunchSpecial.find(params[:id])
		@lunch_special.downvote_by current_user
		redirect_to :back
	end

	private

    def lunch_special_params
      params.require(:lunch_special).permit(:title, :description, :restaurant, :address, :latitude, :longitude, :price, :calories, :restaurant_id, :avatar)
      # params.require(:lunch_special).permit(:title, :description, :restaurant_name, :restaurant_address, :image_content_type, :image_file_size, :price, :calories, :restaurant_id, :avatar).merge(restaurant: params[:restaurant_id])
    end


    
end

