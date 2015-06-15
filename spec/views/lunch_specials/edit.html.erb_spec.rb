require 'rails_helper'

RSpec.describe "lunch_specials/edit", type: :view do
  before(:each) do
    @lunch_special = assign(:lunch_special, LunchSpecial.create!(
      :title => "MyString",
      :description => "MyString",
      :restaurant => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip_code => 1,
      :image_name => "MyString",
      :image_content_type => "MyString",
      :image_file_size => 1,
      :price => "9.99",
      :calories => 1
    ))
  end

  it "renders the edit lunch_special form" do
    render

    assert_select "form[action=?][method=?]", lunch_special_path(@lunch_special), "post" do

      assert_select "input#lunch_special_title[name=?]", "lunch_special[title]"

      assert_select "input#lunch_special_description[name=?]", "lunch_special[description]"

      assert_select "input#lunch_special_restaurant[name=?]", "lunch_special[restaurant]"

      assert_select "input#lunch_special_address[name=?]", "lunch_special[address]"

      assert_select "input#lunch_special_city[name=?]", "lunch_special[city]"

      assert_select "input#lunch_special_state[name=?]", "lunch_special[state]"

      assert_select "input#lunch_special_zip_code[name=?]", "lunch_special[zip_code]"

      assert_select "input#lunch_special_image_name[name=?]", "lunch_special[image_name]"

      assert_select "input#lunch_special_image_content_type[name=?]", "lunch_special[image_content_type]"

      assert_select "input#lunch_special_image_file_size[name=?]", "lunch_special[image_file_size]"

      assert_select "input#lunch_special_price[name=?]", "lunch_special[price]"

      assert_select "input#lunch_special_calories[name=?]", "lunch_special[calories]"
    end
  end
end
