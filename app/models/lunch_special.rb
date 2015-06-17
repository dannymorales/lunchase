class LunchSpecial < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurants
	has_many :ingredients
	# validates :restaurant_id, presence: true
	validates :price, presence: true
end
