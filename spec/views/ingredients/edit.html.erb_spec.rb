require 'rails_helper'

RSpec.describe "ingredients/edit", type: :view do
  before(:each) do
    @ingredient = assign(:ingredient, Ingredient.create!(
      :ingredients => "MyString",
      :lunch_special_id => 1
    ))
  end

  it "renders the edit ingredient form" do
    render

    assert_select "form[action=?][method=?]", ingredient_path(@ingredient), "post" do

      assert_select "input#ingredient_ingredients[name=?]", "ingredient[ingredients]"

      assert_select "input#ingredient_lunch_special_id[name=?]", "ingredient[lunch_special_id]"
    end
  end
end
