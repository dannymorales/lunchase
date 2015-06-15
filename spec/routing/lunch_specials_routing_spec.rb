require "rails_helper"

RSpec.describe LunchSpecialsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lunch_specials").to route_to("lunch_specials#index")
    end

    it "routes to #new" do
      expect(:get => "/lunch_specials/new").to route_to("lunch_specials#new")
    end

    it "routes to #show" do
      expect(:get => "/lunch_specials/1").to route_to("lunch_specials#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/lunch_specials/1/edit").to route_to("lunch_specials#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/lunch_specials").to route_to("lunch_specials#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/lunch_specials/1").to route_to("lunch_specials#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/lunch_specials/1").to route_to("lunch_specials#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lunch_specials/1").to route_to("lunch_specials#destroy", :id => "1")
    end

  end
end
