	class LunchSpecialsController < InheritedResources::Base
before_action :authenticate_user!, except: [:index, :show]

	def index
		@lunch_specials = LunchSpecial.all.order('price ASC')
	end

	def new
		@lunch_special = LunchSpecial.new
	end

	def create
		@lunch_special = LunchSpecial.new(lunch_special_params)
		if @lunch_special.save
			redirect_to @lunch_special, notice: "A new lunch special was created"
		else
			render "new"
		end	
	end
	def show
		@lunch_special = LunchSpecial.find(params[:id])
		@lunch_special.user
	end

	def edit
		@lunch_special = LunchSpecial.find(params[:id])
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

private

    def lunch_special_params
      params.require(:lunch_special).permit(:title, :description, :restaurant_name, :restaurant_address, :image_content_type, :image_file_size, :price, :calories, :restaurant_id)
    end
end

