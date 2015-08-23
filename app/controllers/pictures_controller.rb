class PicturesController < InheritedResources::Base
	before_action :authenticate_user!, except: [:index, :show]
	
	def show
		@picture = Picture.find(params[:id])
	end

	def create
		@picture = Picture.new
		@picture.lunch_special_id = @lunch_special
		if @picture.save
			redirect_to 'lunch_special_path', notice: "new picture added"
		end
	end
	

  private

    def picture_params
      params.require(:picture).permit(:description, :image, :lunch_special_id, :user_id).merge(:user_id => current_user.id)
    end
end

