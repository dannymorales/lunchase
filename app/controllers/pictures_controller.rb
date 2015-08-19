class PicturesController < InheritedResources::Base
	before_action :authenticate_user! except: [:index, :show]
	
	def index
		@lunch_special = LunchSpecial.find(params[:id])
		@pictures = @lunch_special.pictures

		respond_to do |format|
			format.html
			format.json{render json: @pictures}
		end
	end

	def show
		@picture = Picture.find(params[:id])
		respond_to do |format|
			format.html
			format.json {render json: @picture}
			
		end
	end

	def new
		@pictures = current_user.pictures.build(picture_params)
	end

	def create
		@lunch_special = LunchSpecial.find(params[:id])
		@picture = @lunch_special.picture.build(picture_params)
		if @picture.save
			respond_to do |format|
				format.html {
					render :json => [@picture.to_jq_upload].to_json,
					:content_type => 'text/html',
					:layout => false
				}
				format.json {
					render :json => [@picture.to_jq_upload].to_json
				}
			end
		else
			render :json [{:error => 'custom_failure'}], status => 304
		end
	end
	def edit
		@picture = Picture.find(params[:id])
	end

	def update
		@lunch_special = LunchSpecial.find(params[:id])
		@picture = @lunch_special.picture.find(params[:id])

		respond_to do |format|
			if @picture.update_attributes(picture_params)
				format.html {redirect_to lunch_special_path(@lunch_special), notice: 'Picture was sucessfully updated'},
				format.json {head: no_content}
			else
				format.html {render action: 'edit'}
				format.json {render :json @picture.errors, status: :unprocessable_entity}
			end
		end
	end
	def destroy
		@lunch_special = LunchSpecial.find(params[:id])
		@picture = @lunch_special.picture.find(params[:id])
			respond_to do |format|
				format.html {}
				format.js
			end
		@picture.destroy 
		redirect_to lunch_special(@lunch_special)
	end

  private

    def picture_params
      params.require(:picture).permit(:description, :image, :lunch_special_id, :user_id)
    end
end

