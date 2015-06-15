require 'rails_helper'

RSpec.describe "ingredients/show", type: :view do
  before(:each) do
    @ingredient = assign(:ingredient, Ingredient.create!(
      :ingredients => "Ingredients",
      :lunch_special_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Ingredients/)
    expect(rendered).to match(/1/)
  end
end
