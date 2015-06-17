require 'rails_helper'

RSpec.describe "restaurants/edit", type: :view do
  before(:each) do
    @restaurant = assign(:restaurant, Restaurant.create!(
      :name => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip_code => 1,
      :telephone => 1,
      :webpage => "MyString"
    ))
  end

  it "renders the edit restaurant form" do
    render

    assert_select "form[action=?][method=?]", restaurant_path(@restaurant), "post" do

      assert_select "input#restaurant_name[name=?]", "restaurant[name]"

      assert_select "input#restaurant_address[name=?]", "restaurant[address]"

      assert_select "input#restaurant_city[name=?]", "restaurant[city]"

      assert_select "input#restaurant_state[name=?]", "restaurant[state]"

      assert_select "input#restaurant_zip_code[name=?]", "restaurant[zip_code]"

      assert_select "input#restaurant_telephone[name=?]", "restaurant[telephone]"

      assert_select "input#restaurant_webpage[name=?]", "restaurant[webpage]"
    end
  end
end
