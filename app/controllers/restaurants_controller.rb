class RestaurantsController < InheritedResources::Base

	before_action :authenticate_user!, except: [:index, :show]


	def index
		@location = Location.last
		session[:address] = @location.address
		@restaurants = Restaurant.near(session[:address], 2)
		@q = @restaurants.ransack(params[:q])
  		@restaurants = @q.result(distinct: true)
	end

	def new
		@restaurant = current_user.restaurants.new
	end

	def create
		@restaurant = current_user.restaurants.new(restaurant_params)
		respond_to do |format|
			if @restaurant.save
				format.html {redirect_to @restaurant, notice: "A new restaurant was created"}
				format.json {render :show, status: :created, location: @restaurant}
			else
				format.html {render :new}
				format.json {render json: @restaurant.errors, status: :unproccessable_entity}
			end
		end	
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@url = [@restaurant, LunchSpecial.new]
		@hash = Gmaps4rails.build_markers(@restaurant) do |restaurant, marker|
  			marker.lat restaurant.latitude
  			marker.lng restaurant.longitude
		end
		@location = Location.last
		session[:address] = "#{@location.latitude},  #{@location.longitude}"
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.update(restaurant_params)
			redirect_to @restaurant
		else
			render 'edit'
		end
	end

	def destroy		
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		redirect_to lunch_specials_path
	end

	private

    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :city, :state, :zip_code, :telephone, :webpage, :user_id)
    end
end

