require 'rails_helper'

RSpec.describe "ingredients/new", type: :view do
  before(:each) do
    assign(:ingredient, Ingredient.new(
      :ingredients => "MyString",
      :lunch_special_id => 1
    ))
  end

  it "renders new ingredient form" do
    render

    assert_select "form[action=?][method=?]", ingredients_path, "post" do

      assert_select "input#ingredient_ingredients[name=?]", "ingredient[ingredients]"

      assert_select "input#ingredient_lunch_special_id[name=?]", "ingredient[lunch_special_id]"
    end
  end
end
