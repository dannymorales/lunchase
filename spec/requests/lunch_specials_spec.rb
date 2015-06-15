require 'rails_helper'

RSpec.describe "LunchSpecials", type: :request do
  describe "GET /lunch_specials" do
    it "works! (now write some real specs)" do
      get lunch_specials_path
      expect(response).to have_http_status(200)
    end
  end
end
