class LunchSpecial < ActiveRecord::Base
	belongs_to :user
	has_many :ingredients
	validates :restaurant, presence: true
	validates :address, presence: true
	validates :city, presence: true
	validates :price, presence: true, numericality: true
end
