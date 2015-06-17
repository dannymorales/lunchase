require 'rails_helper'

RSpec.describe "restaurants/index", type: :view do
  before(:each) do
    assign(:restaurants, [
      Restaurant.create!(
        :name => "Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip_code => 1,
        :telephone => 2,
        :webpage => "Webpage"
      ),
      Restaurant.create!(
        :name => "Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip_code => 1,
        :telephone => 2,
        :webpage => "Webpage"
      )
    ])
  end

  it "renders a list of restaurants" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Webpage".to_s, :count => 2
  end
end
