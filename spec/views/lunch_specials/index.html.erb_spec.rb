require 'rails_helper'

RSpec.describe "lunch_specials/index", type: :view do
  before(:each) do
    assign(:lunch_specials, [
      LunchSpecial.create!(
        :title => "Title",
        :description => "Description",
        :restaurant => "Restaurant",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip_code => 1,
        :image_name => "Image Name",
        :image_content_type => "Image Content Type",
        :image_file_size => 2,
        :price => "9.99",
        :calories => 3
      ),
      LunchSpecial.create!(
        :title => "Title",
        :description => "Description",
        :restaurant => "Restaurant",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip_code => 1,
        :image_name => "Image Name",
        :image_content_type => "Image Content Type",
        :image_file_size => 2,
        :price => "9.99",
        :calories => 3
      )
    ])
  end

  it "renders a list of lunch_specials" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Restaurant".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Image Name".to_s, :count => 2
    assert_select "tr>td", :text => "Image Content Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
