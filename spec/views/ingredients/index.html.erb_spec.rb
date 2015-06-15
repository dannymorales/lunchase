require 'rails_helper'

RSpec.describe "ingredients/index", type: :view do
  before(:each) do
    assign(:ingredients, [
      Ingredient.create!(
        :ingredients => "Ingredients",
        :lunch_special_id => 1
      ),
      Ingredient.create!(
        :ingredients => "Ingredients",
        :lunch_special_id => 1
      )
    ])
  end

  it "renders a list of ingredients" do
    render
    assert_select "tr>td", :text => "Ingredients".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
