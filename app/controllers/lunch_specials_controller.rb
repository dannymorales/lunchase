class LunchSpecialsController < InheritedResources::Base
	before_action :authenticate_user!, except: [:index, :show]
	

	def index
		@lunch_specials = LunchSpecial.all.order('price ASC')
	end

	def new
		@lunch_special = current_user.lunch_specials.build
		
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@lunch_special = @restaurant.lunch_specials.create(lunch_special_params)
		@lunch_special.restaurant = @restaurant
		if @lunch_special.save
			redirect_to @lunch_special, notice: "A new lunch special was created"
		else
			render "new"
		end	
	end
	def show
		@lunch_special = LunchSpecial.find(params[:id])
		@lunch_special.restaurant
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
      params.require(:lunch_special).permit(:title, :description, :restaurant_name, :restaurant_address, :image_content_type, :image_file_size, :price, :calories, :restaurant_id, :avatar)
      # params.require(:lunch_special).permit(:title, :description, :restaurant_name, :restaurant_address, :image_content_type, :image_file_size, :price, :calories, :restaurant_id, :avatar).merge(restaurant: params[:restaurant_id])
    end


    
end

