require 'rails_helper'

RSpec.describe "lunch_specials/show", type: :view do
  before(:each) do
    @lunch_special = assign(:lunch_special, LunchSpecial.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Restaurant/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Image Name/)
    expect(rendered).to match(/Image Content Type/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/3/)
  end
end
