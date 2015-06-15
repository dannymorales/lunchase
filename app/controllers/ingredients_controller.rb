class IngredientsController < InheritedResources::Base

  private

    def ingredient_params
      params.require(:ingredient).permit(:ingredients, :lunch_special_id)
    end
end

